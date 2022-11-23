module Lookbook
  class PreviewCollection < EntityCollection
    include HierarchicalCollection

    def find_example_by_path(lookup_path)
      examples.find_by_path(lookup_path)
    end

    def find_by_preview_class(klass)
      find { |preview| preview.preview_class.name == klass.to_s }
    end

    def find_by_file_path(path)
      find { |preview| preview.file_path.to_s == path.to_s }
    end

    def load(code_objects, changes = nil)
      changes.present? ? reload_changed(code_objects, changes) : reload_all(code_objects)
    end

    def reload_all(code_objects)
      @entities = []
      previews = code_objects.map { |obj| PreviewCollection.preview_from_code_object(obj) }.compact
      add(previews)
    end

    def reload_changed(code_objects, changes)
      modified = Array(changes[:modified])
      removed = Array(changes[:removed]) + modified
      added = Array(changes[:added]) + modified

      removed.each { |path| remove_by_file_path(path) }

      previews = added.map do |path|
        code_object = code_objects.find { |obj| obj if obj&.file.to_s == path.to_s }
        PreviewCollection.preview_from_code_object(code_object) if code_object
      end.compact

      add(previews)
    end

    def remove_by_file_path(path)
      @entities.reject! { |preview| preview.file_path.to_s == path.to_s }
      clear_cache
    end

    def self.preview_from_code_object(code_object)
      klass = code_object.path.constantize
      Preview.new(code_object) if preview_class?(klass)
    rescue => exception
      Lookbook.logger.error exception.to_s
      nil
    end

    def self.preview_class?(klass)
      if klass.ancestors.include?(ViewComponent::Preview)
        !klass.respond_to?(:abstract_class) || klass.abstract_class != true
      end
    end

    protected

    def examples
      @_cache[:examples] ||= PreviewExampleCollection.new(flat_map(&:examples))
    end
  end
end

<div align="center">
<br>
<p><a href="https://lookbook.build"><img src=".github/assets/lookbook_logo.svg" width="240"></a></p>

<p>A UI development environment for Ruby on Rails applications.</p>

<p><strong><a href="https://lookbook.build">Documentation</a> &nbsp;|&nbsp; <a href="http://demo.lookbook.build/">Demo site</a></strong></p>

<p><a href="https://rubygems.org/gems/lookbook"><img src="https://img.shields.io/gem/v/lookbook" alt="Gem version"></a>
<a href="https://github.com/ViewComponent/lookbook/actions/workflows/ci.yml"><img src="https://github.com/ViewComponent/lookbook/actions/workflows/ci.yml/badge.svg" alt="CI status"></a></p>

</div>

---

[![Lookbook UI](.github/assets/lookbook_ui.png)](http://lookbook.build/)

## Development

Lookbook is implemented as an isolated [Rails Engine](https://guides.rubyonrails.org/engines.html) and uses [ViewComponent](https://viewcomponent.org), [Tailwind](https://tailwindcss.com/) and [Alpine](https://alpinejs.dev/) for its UI.

This repository contains:

* The Lookbook source code ([`/app`](https://github.com/ViewComponent/lookbook/tree/main/app), [`/lib`](https://github.com/ViewComponent/lookbook/tree/main/lib), [`/config`](https://github.com/ViewComponent/lookbook/tree/main/config), etc)
* The Lookbook [documentation site](#docs-site) source code and content ([`/docs`](https://github.com/ViewComponent/lookbook/tree/main/docs)).
* A [test suite](#testing) with a 'runable' dummy app ([`/spec`](https://github.com/ViewComponent/lookbook/tree/main/spec)).

### Documentation site

The [Lookbook docs site](https://lookbook.build) is built using [Bridgetown](https://www.bridgetownrb.com/) and the source files can be found in the `./docs` directory.

To preview changes locally you can run a development version of the docs site:

1. Clone this repo
2. Install dependencies: `bundle install`
3. Start the app: `bin/docs`
4. Visit http://localhost:4000 

### Testing

Lookbook uses [RSpec](https://relishapp.com/rspec) for testing.

Tests can be run using the `rake spec` or `bundle exec rspec` commands.

The dummy app that the tests are being run against can be viewed by running the `bin/dummy` command and then browsing to http://localhost:9292/lookbook

### Releases

Lookbook uses [Release It!](https://github.com/release-it/release-it) to automate the release process.

Running `npm run release` will start the process of publishing a new release and walks though all the steps from picking a version number to publishing the updated gem.

Publishing a release requires write permissions for this repository (ViewComponent/lookbook) and 2FA publish permissions for Lookbook on RubyGems.

## Contributing

Lookbook is an un-funded open source project and contributions of all types and sizes are most welcome!

Please take the time to read over the [Contributing](./CONTRIBUTING.md) guide before making your first contribution and if anything isn't clear then [start a discussion](https://github.com/ViewComponent/lookbook/discussions) and we will do our best to help you out.

## Contributors 

Lookbook was created by [Mark Perkins](https://github.com/allmarkedup) and continues to grow
&amp; improve thanks to the ideas, suggestions and hard work of all of [these excellent humans](https://github.com/ViewComponent/lookbook/graphs/contributors):
<br>
<br>
<a href="https://github.com/ViewComponent/lookbook/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ViewComponent/lookbook&columns=14" width="800" />
</a>

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
# Rails Menu

This small app let you create menu in your app and seamlessly generate views for it later.

## Installation

In Gemfile

``` ruby
gem 'rails_menu'
```

And install bundle

``` bash
bundle install
```

## Setting up menu

Anywhere in your app add code like that:

``` ruby
RailsMenu::Set.new('default', [
  [:home, root_path],
  [:settings, settings_path]
])
```

This will create basic menu that will be accessible later. You can also split this to several independent lines:

``` ruby
menu = RailsMenu::Set.new
menu.add(:home, root_path)
menu.add(:settings, root_path)
```

and even specify custom options:

``` ruby
menu = RailsMenu::Set.new
menu.add(:home, root_path, :label => "Homepage")
menu.add(:settings, root_path, :label => "My Settings")
```

## Configuring which menu is currently active

In your controller you can use method "set_meny" to inform RailsMenu that you can set one of menus to default. Menu id is first parameter that was provided on creating menu.

``` ruby
class Settings < ApplicationController
  set_menu :settings
end
```

You can also add any options that are acceptable by before_filter:

``` ruby
class Settings < ApplicationController
  set_menu :settings, :except => :some_action
end
```

If you think that it's easier to provide current menu directly in action then you are free to do so:

``` ruby
class Settings < ApplicationController
  def index
    set_menu :settings
  end
end
```

## Displaying menu

In you view you can call helper "menu" to receive table of active menus. Each element will have following elements:

- id - this is id set as first argument on creating menu. Usually needed only internal
- url - url provided to menu
- options - hash that was passed as last argument on creation
- active - true or false depending on current set menu

``` erb
<p>My menu:</p>
<ul>
  <% menu.each do |menu_element| %>
    <li id="menu-<%= menu_element.id %>" class="<%= menu.active ? 'active' : nil %>">
      <%= link_to menu_element.options[:label], menu_element.url %>
    </li>
  <% end %>
</ul>
```

## Creating multiple different menus

Both RailsMenu::Set.new and menu helper can receive menu name as first parameter. At defualt it's set to "default", but if you want to create multiple menus then you should provide different names. Example:

``` ruby
menu = RailsMenu::Set.new('admin')
menu.add(:home, root_path, :label => "Homepage")
menu.add(:users, users_path, :label => "Users")
```

``` erb
<% menu('admin').each do |menu_element| %>
  ...
<% end %>
```

## License

(The MIT License)

Copyright (c) 2011 Bernard Potocki

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
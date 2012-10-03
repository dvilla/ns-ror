# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  # Define the primary navigation
  navigation.items do |primary| 
    primary.item :home, 'Home', root_path, :icon => ['icon-home', 'icon-black']
    primary.item :library, 'Library', books_path, icon: ['icon-book', 'icon-black'], if: Proc.new { admin_signed_in? } do |lib|
      #lib.item :books, 'Books', books_path
      #lib.item :publisher, 'Publisher', publishers_path
      #lib.item :suthors, 'Authors', authors_path
    end
    primary.dom_class = 'nav'
  end

end

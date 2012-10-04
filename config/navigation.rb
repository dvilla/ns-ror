# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  # Define the primary navigation
  navigation.items do |primary| 
    primary.item :home, 'Home', root_path, :icon => ['icon-home', 'icon-black']
    primary.item :library, 'Library', admin_books_path, icon: ['icon-book', 'icon-black'], if: Proc.new { admin_signed_in? } do |lib|
      #lib.item :books, 'Books', admin_books_path
      #lib.item :publisher, 'Publisher',admin_ publishers_path
      #lib.item :suthors, 'Authors',admin_ authors_path
    end
    primary.dom_class = 'nav'
  end

end

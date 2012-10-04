# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'

  # Define the primary navigation
  navigation.items do |primary| 
    primary.item :home, 'Home', admin_index_path
    primary.item :library, 'Library', admin_books_path, if: Proc.new { admin_signed_in? } do |lib|
      lib.item :header_library, 'Library' , class: 'nav-header'
      lib.item :books, 'Books', admin_books_path
      lib.item :publisher, 'Publisher', admin_publishers_path
      lib.item :suthors, 'Authors', admin_authors_path
      lib.dom_class = 'nav nav-list'
    end
    primary.dom_class = 'nav'
  end

end

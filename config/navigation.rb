# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|

  # Define the primary navigation
  navigation.items do |primary| 
    primary.item :home, 'Home', root_path, icon: ['icon-home', 'icon-black']
    primary.item :configuration, 'Configuration', ns_library_path, icon: ['icon-gear', 'icon-black'], if: Proc.new { admin_signed_in? }
    primary.item :library, 'Library', ns_library_path, icon: ['icon-book', 'icon-black'], if: Proc.new { admin_signed_in? }
    primary.dom_class = 'nav'
  end

end

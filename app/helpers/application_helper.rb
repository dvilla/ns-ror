module ApplicationHelper
 def render_controls_sessions
   if user_signed_in?
     render partial: 'layouts/user_signed'
   elsif admin_signed_in?
     render partial: 'layouts/admin_signed'
   else
     render partial: 'layouts/log_out'
   end
 end 
end

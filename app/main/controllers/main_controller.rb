# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    def index
      # Add code for when the index view is loaded
    end

    def about
      # Add code for when the about view is loaded
    end

    private

    def say_to_all
      puts 'saying to all'
      page.notification_messages << NotificationMessage.say('Broadcast Notification', "Hello to All")
    end


    def say_to_me
      puts 'saying to me'
      Volt.current_user.notification_messages << NotificationMessage.say('User Notification', "Hello to #{Volt.current_user.full_name}")
    end

    def is_logged_in?
      Volt.current_user.then do |user|
        !user
      end
    end

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end

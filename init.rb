require 'redmine'
require 'dynamic_form'

Rails.configuration.to_prepare do
  require_dependency 'tracker'
  require_dependency 'redmine_reminder/hooks'
  unless Tracker.included_modules.include? RedmineReminder::TrackerPatch
    Tracker.send :include, RedmineReminder::TrackerPatch
  end
end

Redmine::Plugin.register :redmine_reminder do
  name 'Advanced reminder'
  author 'Milan Stastny of ALVILA SYSTEMS & Undev'
  description 'E-mail notification of issues due date you are involved in (Assignee, Author, Watcher)'
  version '0.1.1 custom'
  url 'https://github.com/Undev/redmine_reminder'
  author_url 'http://www.alvila.com'
end

Redmine::MenuManager.map :admin_menu do |menu|
  menu.push :reminder_options, {:controller => :reminder_configuration, :action => :edit}, :caption => :label_reminder_options
end


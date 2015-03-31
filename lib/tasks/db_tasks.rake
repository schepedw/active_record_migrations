ROLE = 'weekly_workshop'
namespace :db do
  desc "Create missing PG roles"
  task :create_roles do
    sh "createuser --createdb --login #{ROLE}|| echo Already exists."
  end

end

if ENV['RAILS_ENV'] == 'test'
  Rake::TaskManager.class_eval do
    def delete_task(task_name)
      @tasks.delete(task_name.to_s)
    end
  end

  Rake.application.delete_task("db:test:load")

  namespace :db do
    namespace :test do
      task :load do
      end
    end
  end
end

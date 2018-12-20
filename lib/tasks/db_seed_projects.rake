#rake db:seed:projects
  namespace :db do
    namespace :seed do
      desc "Seed Users from /db/seeds/seeds.yml"
      task :projects => :environment do
        db_seed_projects
      end
    end
  end

  def db_seed_projects

  path = Rails.root.join('db','seeds','seeds.yml')
  puts "Seeding file #{path}"
  File.open(path) do |file|
    YAML.load_documents(file) do |doc|
      doc.keys.sort.each do |key|
        #puts "Seeding key #{key}"
        p "Seeding key #{key}"
        attributes = doc[key]
        db_parse_projects(attributes)
      end
    end
  end
end

def db_parse_projects(attributes)
	
	projects = ActiveSupport::HashWithIndifferentAccess.new
	#p attributes
	#p "==============================="
	attributes.each do |a|
		#p a
		projects["title"] = a['title']
		first_proj = Project.where(title: a['title']).first_or_create
		if first_proj
			p "#{projects} -- > exists"
		else
			p "#{projects} -- > new"
			pr = Project.create(projects)
		end
		todosArray = a['todos']
		#p
		#p "todosArray:"
		#p todosArray
		#p "end"
		#p
		todosArray.each do |todo|
			#p todo
			#todo = Todo.new(title: todo['text'], isComplited: todo['isComplited'])
			#p todo.project
			#todo.project = Project.where(title: a['title']).last;
			#p todo.project
			#todo.save
			project = Project.where(title: a['title']).last;
			todo_exists = Todo.where(title: todo['text'], project: project).first_or_create
			if todo_exists
				p "#{todo} -- > exists"
			else
				p "#{todo} -- > new"
				Todo.create(todo)
				todo.project = project;
				todo.save;
			end
				
		end
	end
end
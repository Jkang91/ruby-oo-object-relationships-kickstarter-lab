class Backer

    attr_accessor :name
    
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        ProjectBacker.all.select { |project| project.title == self}
    end

    def self.all
        @@all
    end
    
    def backed_projects
        project = ProjectBacker.all.select { |project_backer| project_backer.backer == self }
        project.collect {|projects| projects.project}
    end
end
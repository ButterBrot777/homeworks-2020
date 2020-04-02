class Student
  attr_reader :name, :surname
  attr_accessor :homeworks, :mentor

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = []
    @mentor = []
  end

  def full_name
    "#{@name} #{@surname}"
  end

  def do_homework(homework_data)
    Homework.new(homework_data)
  end

  def submit_homework(homework_data)
    homework = do_homework(homework_data)
    homeworks << homework
    notificate_mentor(homework)
  end

  def show_homeworks
    "Here are your homeworks: #{homeworks}"
  end

  def notificate_mentor(homework)
    mentor.each do |mentor|
      mentor.notifications << notify_message(homework)
    end
  end

  def notify_message(homework)
    "#{full_name} sent new homework: #{homework}"
  end
end

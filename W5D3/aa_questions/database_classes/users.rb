require_relative 'questions_database.rb'
require_relative 'questions.rb'
require_relative 'replies.rb'
require_relative 'question_follows.rb'

class User
    
    attr_accessor :id, :fname, :lname
    
    def self.find_by_id(id)
        data = QDB.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            id = (?)
        SQL
        User.new(data[0])
    end

    def self.find_by_name(fname, lname)
        data = QDB.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = (?) AND lname = (?)
        SQL
        User.new(data[0])
    end


    def self.all
        data = QDB.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end
    
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def liked_questions
        raise "#{self} not in database" unless @id
        QuestionFollow.liked_questions_for_user_id(self.id)
    end

    def authored_questions 
        raise "#{self} not in database" unless @id
        Question.find_by_author_id(self.id)
    end

    def authored_replies
        raise "#{self} not in database" unless @id
        Reply.find_by_user_id(self.id)
    end

    def followed_questions
        raise "#{self} not in database" unless @id
        QuestionFollow.followed_questions_for_user_id(self.id)
    end

    def average_karma
        raise "#{self} not in database" unless @id
        data = QDB.instance.execute(<<-SQL, self.id)
        SELECT
           COUNT(question_likes.user_id) / CAST(COUNT(DISTINCT(questions.id)) AS FLOAT) AS Average
        FROM
            users
        JOIN
            questions ON questions.associated_author = users.id
        LEFT JOIN 
            question_likes ON questions.id = question_likes.question_id
        WHERE users.id = (?)
        GROUP BY users.id
            
        SQL
        data[0].values[0]
    end

    def create
        raise "#{self} already in database" if self.id
        QDB.instance.execute(<<-SQL, self.fname, self.lname)
        INSERT INTO
            users (fname, lname)
        VALUES
            (?, ?)
        SQL
        self.id = QDB.instance.last_insert_row_id
    end

    def update
        raise '#{self} not in database' unless @id
        QDB.instance.execute(<<-SQL, @fname, @lname, @id)
            UPDATE
                users
            SET
                fname = ?, lname = ?
            WHERE
                id = ?
        SQL
    end

end
require_relative 'questions_database.rb'
require_relative 'users.rb'
require_relative 'replies.rb'
require_relative 'question_follows.rb'

class Question 

    attr_accessor :id, :title, :body, :associated_author

    def self.all
        data = QDB.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_author_id(author_id)
        data = QDB.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            associated_author = (?)
        SQL
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_id(question_id)
        data = QDB.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            questions
        WHERE
            id = (?)
        SQL
        Question.new(data[0])
    end

    def self.most_followed(n)
        QuestionFollow.most_followed_questions(n)
    end

    def self.most_liked(n)
        QuestionLike.most_liked_questions(n)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @associated_author = options['associated_author']
    end

    def create
        raise "#{self} already in database" if self.id
        QDB.instance.execute(<<-SQL, self.title, self.body, self.associated_author)
        INSERT INTO
            questions (title, body, associated_author)
        VALUES
            (?, ?, ?)
        SQL
        self.id = QDB.instance.last_insert_row_id
    end

    def likers
        raise "#{self} not in database" unless @id
        QuestionFollow.likers_for_question_id(self.id)
    end
    
    def num_likes
        raise "#{self} not in database" unless @id
        QuestionFollow.num_likes_for_question_id(self.id)
    end

    def author
        raise "#{self} not in database" unless @id
        User.find_by_id(self.associated_author)
    end

    def replies
        raise "#{self} not in database" unless @id
        Reply.find_by_question_id(self.id)
    end

    def followers
        raise "#{self} not in database" unless @id
        QuestionFollow.followers_for_question_id(self.id)
    end

    def update
        raise "#{self} not in database" unless @id
        QDB.instance.execute(<<-SQL, @title, @body, @associated_author, @id)
            UPDATE
                questions
            SET
                title = ?, body = ?, associated_author = ?
            WHERE
                id = ?
        SQL
    end

end
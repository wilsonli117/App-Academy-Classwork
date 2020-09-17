require_relative 'questions_database.rb'
require_relative 'users.rb'
require_relative 'questions.rb'

class Reply

    attr_accessor :id, :body, :subject, :subject_question_id, :author_id, :parent_reply_id

    def self.find_by_user_id(user_id)
        data = QDB.instance.execute(<<-SQL, user_id)
        SELECT
            *
        FROM
            replies
        WHERE
            author_id = (?)
        SQL
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_question_id(question_id)
        data = QDB.instance.execute(<<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            subject_question_id = (?)
        SQL
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_id(reply_id)
        data = QDB.instance.execute(<<-SQL, reply_id)
        SELECT
            *
        FROM
            replies
        WHERE
            id = (?)
        SQL
        Reply.new(data[0])
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @subject_question_id = options['subject_question_id']
        @author_id = options['author_id']
        @parent_reply_id = options['parent_reply_id']
    end

    def create
        raise "#{self} already in database" if self.id
        QDB.instance.execute(<<-SQL, self.body, self.subject_question_id, self.author_id, self.parent_reply_id)
        INSERT INTO
            replies (body, subject_question_id, author_id, parent_reply_id)
        VALUES
            (?, ?, ?, ?)
        SQL
        self.id = QDB.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless @id
        QDB.instance.execute(<<-SQL, self.body, self.subject_question_id, self.author_id, self.parent_reply_id, self.id)
            UPDATE
                replies
            SET
                body = (?), subject_question_id = (?), author_id = (?), parent_reply_id = (?)
            WHERE
                id = (?)
        SQL
    end
    
    def author
        raise "#{self} not in database" unless @id
        User.find_by_id(self.author_id)
    end

    def question
        raise "#{self} not in database" unless @id
        Question.find_by_id(self.subject_question_id)
    end
    
    def parent_reply
        raise "#{self} not in database" unless @id
        raise "#{self} has no parent reply" if self.parent_reply_id.nil?
        Reply.find_by_id(self.parent_reply_id)
    end

    def child_replies
        raise "#{self} not in database" unless @id
        data = QDB.instance.execute(<<-SQL, self.id)
        SELECT
            *
        FROM
            replies
        WHERE
            parent_reply_id = (?)
        SQL
        data.map { |datum| Reply.new(datum) }
    end

end

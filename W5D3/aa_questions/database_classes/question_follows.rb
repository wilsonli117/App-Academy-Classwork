require_relative 'questions_database.rb'
require_relative 'questions'
require_relative 'users'

class QuestionFollow

    def self.most_followed_questions(n)
        data = QDB.instance.execute(<<-SQL, n)
            SELECT
                questions.id, questions.title, questions.body, questions.associated_author
            FROM
                question_follows
            JOIN
                questions ON questions.id = question_follows.question_id 
            GROUP BY
                question_follows.question_id
            ORDER BY
                COUNT(question_follows.user_id) DESC, questions.id ASC
            LIMIT
                (?)
            SQL
        data.map { |datum| Question.new(datum) }
    end

    def self.followers_for_question_id(question_id)
        data = QDB.instance.execute(<<-SQL, question_id)
        SELECT
            users.id, users.fname, users.lname
        FROM
            question_follows
        JOIN
            users on user_id = users.id
        WHERE
            question_id = (?)
        SQL
        data.map { |datum| User.new(datum) }        
    end

    def self.followed_questions_for_user_id(user_id)
        data = QDB.instance.execute(<<-SQL, user_id)
            SELECT
                questions.id, questions.title, questions.body, questions.associated_author
            FROM
                question_follows
            JOIN
                questions ON questions.id = question_follows.question_id 
            WHERE
                question_follows.user_id = (?)
            SQL

        data.map { |datum| Question.new(datum) }      
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

end
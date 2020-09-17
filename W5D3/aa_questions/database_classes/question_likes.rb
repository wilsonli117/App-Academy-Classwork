require_relative 'questions_database.rb'
require_relative 'questions'


class QuestionLike

    def self.most_liked_questions(n)

         data = QDB.instance.execute(<<-SQL, n)
            SELECT
                questions.id, questions.title, questions.body, questions.associated_author
            FROM
                question_likes
            JOIN
                questions ON questions.id = question_likes.question_id 
            GROUP BY
                question_likes.question_id
            ORDER BY
                COUNT(question_likes.user_id) DESC, questions.id ASC
            LIMIT
                (?)
            SQL
        data.map { |datum| Question.new(datum) }
        
    end



    def self.likers_for_question_id(question_id)
        data = QDB.instance.execute(<<-SQL, question_id)
        SELECT
            users.id, users.fname, users.lname
        FROM
            question_likes
        JOIN
           users ON users.id = question_likes.user_id
        WHERE
            question_likes.question_id = (?)
        SQL
        data.map { |datum| User.new(datum) }    
    end

    def self.num_likes_for_question_id(question_id)
        data = QDB.instance.execute(<<-SQL, question_id)
        SELECT
            COUNT(users.id)
        FROM
            question_likes
        JOIN
           users ON users.id = question_likes.user_id
        WHERE
            question_likes.question_id = (?)
        SQL
        data[0].values[0]
    end

    def self.liked_questions_for_user_id(user_id)
        data = QDB.instance.execute(<<-SQL, user_id)
        SELECT
            questions.id, questions.title, questions.body, questions.associated_author
        FROM
            question_likes
        JOIN
           questions on questions.id = question_likes.question_id
        WHERE
            question_likes.user_id = (?)
        SQL
        data.map { |datum| Question.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    

end
class AnswerMailer < ApplicationMailer

    def hello_world
      mail(
        to: "brandon@codecore.ca",
        from: "info@awesome_answers.io",
        cc: "tech_support@codecore.ca",
        bcc: "some_more_people@example.ca",
        subject: "Hello, World from Awesome Answers App!"
      )
    end
  end
  
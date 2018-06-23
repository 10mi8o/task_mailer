class UserMailer < ApplicationMailer

  default form: 'notification@example.com'

  def create_blog_mail(blog)
    @blog = blog
    @url = 'https://afternoon-fjord-12328.herokuapp.com/'
    mail(to: "totoma855@gmail.com", subject: 'blogを投稿しました')


  end
end

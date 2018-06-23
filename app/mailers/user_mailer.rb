class UserMailer < ApplicationMailer

  default form: 'notification@example.com'

  def create_blog_mail(blog)
    @blog = blog
    @url = 'https://serene-waters-28718.herokuapp.com/'
    mail(to: "totoma855@gmail.com", subject: 'blogを投稿しました')

    # mail to: "自分のメールアドレス", subject: 'ブログ投稿確認のメール'

  end
end

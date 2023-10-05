class TaskMailer < ApplicationMailer
  def creation email(task)
    @task = task
    mail(
      subject: 'タスク作成完了メール'
      to: 'user@example.com'
      from: 'app@example.com'
    )
  end
end

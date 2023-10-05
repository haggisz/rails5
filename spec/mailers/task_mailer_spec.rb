require "rails_helper"

RSpec.describe TaskMailer, type: :mailer do
let(:task) { FactoryBot.create(:task, name: 'メイラー', description: '送信したら確認')}

  let(:text_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
    part.body.raw_source
  end
  let(:html_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
    part.body.raw_source
  end

  describe 'creation_email' do
    let(:mail) { TaskMailer.creation_email(task) }

    it '想定通りのメールが作成される' do
      #ヘッダ
      expect(mail.subject).to eq('タスク作成完了メール')
      expect(mail.to) eq(['user@example.com'])
      expect(mail.from).to eq(['app@example.com'])

      # text形式本文
      expect(text_body).to match('以下のタスクを作成')
      expect(text_body).to match('メイラーSpecを書く')
      expect(text_body).to match('送信したメールの内容を確認')

      # html形式本文
      expect(html_body).to match('以下のタスクを作成')
      expect(html_body).to match('メイラーSpecを書く')
      expect(html_body).to match('送信したメールの内容を確認')

    end
  end

end

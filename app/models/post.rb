class Post < ApplicationRecord
validates :title ,presence: true
validates :start_at ,presence: true
validates :end_at ,presence: true
validate :start_end_check
validate :start_date_before_today

def start_end_check
    if start_at.present? && end_at.present? && start_at > end_at
        errors.add(:終了日,"は開始日より後の日付を入力してください")
    end 
end

def start_date_before_today
    if start_at.present? && end_at.present? && start_at < Date.today
        errors.add(:開始日,"は今日以降の日付で選択してください")
    end
end

end

class Post < ApplicationRecord
    validates :title, presence: true
    validates :title, length: { maximum: 20 }
    validates :startdate, presence: true
    validates :enddate, presence: true
    validates :memo, length: { maximum: 500 }

    validate :startdate_enddate_check

    def startdate_enddate_check
        if startdate.present? && enddate.present? && startdate >= enddate
            errors.add(:enddate, "は開始日より前の日付は登録できません")
        end
    end
end

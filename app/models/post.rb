class Post < ApplicationRecord
    validates :date, {presence: true, }
    validates :push_up, {presence: true, }
    validates :sit_up, {presence: true, }
    validates :run, {presence: true, }
    validates :is_record, {presence: true, }
end

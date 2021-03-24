class Post < ApplicationRecord
    validates :date, {presence: true, }
    validates :push_up, {presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 200}}
    validates :sit_up, {presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 200}}
    # validates :run, {presence: true, }
    validates :run_min, {presence: true, numericality: {greater_than_or_equal_to: 6, less_than: 30}}
    validates :run_sec, {presence: true, numericality: {greater_than_or_equal_to: 0, less_than: 61}}

    validates :is_record, {presence: true, }
end

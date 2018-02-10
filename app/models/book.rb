class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_many :reviews
  has_many :users, through: :reviews
  has_many :memos, as: :memoable

  scope :gihyo, -> { where(publish: "技術評論社") }
  scope :newer, -> { order(published: :desc) }
  scope :whats_new, ->(pub) {
    where(publish: pub).order(published: :desc).limit(5r)
  }

  validates :agreement, acceptance: true
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 100 }

  after_destroy :history_book, unless: Proc.new { |b| b.publish == "unknown" }

  private

  def history_book
    logger.info("deleted: #{self.inspect}")
  end
end

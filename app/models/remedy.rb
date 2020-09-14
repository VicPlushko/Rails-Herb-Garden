class Remedy < ApplicationRecord
    belongs_to :user
    has_many :remedy_herbs, dependent: :destroy
    has_many :herbs, through: :remedy_herbs
    validates :title, :directions, presence: true
    validates :title, uniqueness: true
    accepts_nested_attributes_for :remedy_herbs
    scope :search, -> {where("title LIKE ?", "%#{search}%")}

    # def self.herb
    #     self.remedy_herbs.each do |h|
    #         h.herb.name = herbs
    #     end
    # end



    def self.search(search)
        where("title LIKE ?", "%#{search}%")
      end
end

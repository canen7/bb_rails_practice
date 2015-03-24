class Borrower < ActiveRecord::Base
	has_many :histories
end

module Toyable
  extend ActiveSupport::Concern

  included do
    has_many :toys, as: :toyable
  end

  def receive_toy(name)
    toy = self.find_or_create_by(name: name)
    # missing this piece because it didn't work when I tested it! Will ask in study hall tomorrow.
  end
end

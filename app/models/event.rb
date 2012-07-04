class Event < ActiveRecord::Base

  # Validations
  validates :description, :presence => true, :length => { :within => 10..255 }

  # Mass-assignment protection
  attr_accessible :description

  # Default ordering
  default_scope :order => 'created_at DESC'

  # Default page size
  paginates_per 15

  # Callbacks
  after_save :prune

  private #----

    # Only retain the last 60 events
    def prune
      if Event.count > 60
        cutoff = Event.limit(60).last.created_at
        Event.where(["created_at < ?", cutoff]).delete_all
      end
    end

end
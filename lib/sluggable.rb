module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :generate_slug!
    class_attribute :slug_column
  end

  def to_param
    self.slug
  end

  def generate_slug!
    the_slug = to_slug(self.send(self.class.slug_column.to_sym))
    object = self.class.find_by slug: the_slug
    count = 2
    while object && object != self
      the_slug = append_suffix(the_slug, count)
      object = self.class.find_by slug: the_slug
      count += 1
    end
    self.slug = the_slug.downcase
  end

  def append_suffix(string, count)
    if string.split('_').last.to_i != 0
      return string.split('_').slice(0...-1).join('_') + "_" + count.to_s
    else
      return string + "_" + count.to_s
    end
  end

  def to_slug(name)
    string = name.strip
    string.gsub! /\s*[^A-Za-z0-9]\s*/, '_'
    string.gsub! /_+/,"_"
    string.downcase
  end

  module ClassMethods
    def sluggable_column(col_name)
      self.slug_column = col_name
    end
  end
end

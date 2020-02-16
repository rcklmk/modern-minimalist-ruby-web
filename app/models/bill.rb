class Bill < ApplicationRecord
  include PublicSerializable

  def self.type_t
    I18n.t(['app', *self.to_s.downcase.split('::')].join('.'))
  end

  def public_serialize
    {
      id: id,
      amount: amount
    }
  end
end

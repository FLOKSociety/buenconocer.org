class Signer < ActiveRecord::Base

	before_create :generate_token

  def generate_token
    self.code = secure_digest(Time.now, (1..10).map { rand.to_s})[0,6]
  end

  def secure_digest(*args)
    require 'digest/sha1'
    Digest::SHA1.hexdigest(args.flatten.join('--'))
  end
end

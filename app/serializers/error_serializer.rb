module ErrorSerializer
  def self.serialize(errors)
    return if errors.nil?

    json = {}

    json[:errors] = errors.to_hash.map do |key, value|
      value.map do |msg|
        { id: key, title: msg }
      end
    end

    json
  end
end

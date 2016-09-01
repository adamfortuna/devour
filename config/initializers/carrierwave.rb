CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'AKIAJI4ULCOF3S5OIHMQ',
    aws_secret_access_key: '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'
  }
  config.fog_directory  = 'cocktailfly'
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end

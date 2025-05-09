class DeputySerializer < ActiveModel::Serializer
  attributes :id, :name, :external_id, :cpf, :party, :state, :legislature,
             :total_spent, :photo_url

  def total_spent
    object.expenses.sum(:value_net).to_d
  end

  def photo_url
    "http://www.camara.leg.br/internet/deputado/bandep/#{object.external_id}.jpg"
  end
end

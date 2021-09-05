# frozen_string_literal: true

module Admin
  class OrganizationSerializer < ApplicationSerializer
    attributes :id,
                :name,
                :phone,
                :address,
                :email,
                :facebook_url,
                :linkedin_url,
                :instagram_url
  end
end

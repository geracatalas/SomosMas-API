# frozen_string_literal: true

# spec/integration/blogs_spec.rb
require "swagger_helper"

describe "Auth API" do
  path "/auth/register", swagger_doc: "v1/auth_api.json" do
    post "Create register" do
      tags "Authentication"
      consumes "application/json"
      parameter name: :blog, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          email: { type: :string },
          password: { type: :string }

        },
        required: [ "first_name", "last_name", "email", "password" ]
      }

      response "201", "created" do
        let(:endpoint) { { "first_name": "jose",
          "last_name": "ramon",
          "email": "adminer@admin.com", "password": "123456"  } }
        run_test!
      end

      response "422", ":unprocessable_entity" do
        let(:endpoint) { {  errors: user.errors } }
        run_test!
      end
    end
  end
end

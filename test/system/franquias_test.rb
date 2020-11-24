require "application_system_test_case"

class FranquiasTest < ApplicationSystemTestCase
  setup do
    @franquia = franquias(:one)
  end

  test "visiting the index" do
    visit franquias_url
    assert_selector "h1", text: "Franquias"
  end

  test "creating a Franquia" do
    visit franquias_url
    click_on "New Franquia"

    fill_in "Nome", with: @franquia.nome
    fill_in "Usuario", with: @franquia.usuario_id
    click_on "Create Franquia"

    assert_text "Franquia was successfully created"
    click_on "Back"
  end

  test "updating a Franquia" do
    visit franquias_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @franquia.nome
    fill_in "Usuario", with: @franquia.usuario_id
    click_on "Update Franquia"

    assert_text "Franquia was successfully updated"
    click_on "Back"
  end

  test "destroying a Franquia" do
    visit franquias_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Franquia was successfully destroyed"
  end
end

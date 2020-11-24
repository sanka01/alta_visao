require "application_system_test_case"

class OficinasTest < ApplicationSystemTestCase
  setup do
    @oficina = oficinas(:one)
  end

  test "visiting the index" do
    visit oficinas_url
    assert_selector "h1", text: "Oficinas"
  end

  test "creating a Oficina" do
    visit oficinas_url
    click_on "New Oficina"

    fill_in "Endereco", with: @oficina.endereco_id
    fill_in "Franquia", with: @oficina.franquia_id
    fill_in "Nome", with: @oficina.nome
    fill_in "Usuario", with: @oficina.usuario_id
    click_on "Create Oficina"

    assert_text "Oficina was successfully created"
    click_on "Back"
  end

  test "updating a Oficina" do
    visit oficinas_url
    click_on "Edit", match: :first

    fill_in "Endereco", with: @oficina.endereco_id
    fill_in "Franquia", with: @oficina.franquia_id
    fill_in "Nome", with: @oficina.nome
    fill_in "Usuario", with: @oficina.usuario_id
    click_on "Update Oficina"

    assert_text "Oficina was successfully updated"
    click_on "Back"
  end

  test "destroying a Oficina" do
    visit oficinas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Oficina was successfully destroyed"
  end
end

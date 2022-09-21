defmodule AppWeb.InfoControllerTest do
  use AppWeb.ConnCase

  import App.ChallengesFixtures

  @create_attrs %{name: "some name", start_date: ~D[2022-09-20]}
  @update_attrs %{name: "some updated name", start_date: ~D[2022-09-21]}
  @invalid_attrs %{name: nil, start_date: nil}

  describe "index" do
    test "lists all infos", %{conn: conn} do
      conn = get(conn, Routes.info_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Infos"
    end
  end

  describe "new info" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.info_path(conn, :new))
      assert html_response(conn, 200) =~ "New Info"
    end
  end

  describe "create info" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.info_path(conn, :create), info: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.info_path(conn, :show, id)

      conn = get(conn, Routes.info_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Info"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.info_path(conn, :create), info: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Info"
    end
  end

  describe "edit info" do
    setup [:create_info]

    test "renders form for editing chosen info", %{conn: conn, info: info} do
      conn = get(conn, Routes.info_path(conn, :edit, info))
      assert html_response(conn, 200) =~ "Edit Info"
    end
  end

  describe "update info" do
    setup [:create_info]

    test "redirects when data is valid", %{conn: conn, info: info} do
      conn = put(conn, Routes.info_path(conn, :update, info), info: @update_attrs)
      assert redirected_to(conn) == Routes.info_path(conn, :show, info)

      conn = get(conn, Routes.info_path(conn, :show, info))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, info: info} do
      conn = put(conn, Routes.info_path(conn, :update, info), info: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Info"
    end
  end

  describe "delete info" do
    setup [:create_info]

    test "deletes chosen info", %{conn: conn, info: info} do
      conn = delete(conn, Routes.info_path(conn, :delete, info))
      assert redirected_to(conn) == Routes.info_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.info_path(conn, :show, info))
      end
    end
  end

  defp create_info(_) do
    info = info_fixture()
    %{info: info}
  end
end

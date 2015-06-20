require 'test_helper'

class OutstandingTransactionsControllerTest < ActionController::TestCase
  setup do
    @outstanding_transaction = outstanding_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:outstanding_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create outstanding_transaction" do
    assert_difference('OutstandingTransaction.count') do
      post :create, outstanding_transaction: { amount: @outstanding_transaction.amount, description: @outstanding_transaction.description, kind: @outstanding_transaction.kind, other_party: @outstanding_transaction.other_party }
    end

    assert_redirected_to outstanding_transaction_path(assigns(:outstanding_transaction))
  end

  test "should show outstanding_transaction" do
    get :show, id: @outstanding_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @outstanding_transaction
    assert_response :success
  end

  test "should update outstanding_transaction" do
    patch :update, id: @outstanding_transaction, outstanding_transaction: { amount: @outstanding_transaction.amount, description: @outstanding_transaction.description, kind: @outstanding_transaction.kind, other_party: @outstanding_transaction.other_party }
    assert_redirected_to outstanding_transaction_path(assigns(:outstanding_transaction))
  end

  test "should destroy outstanding_transaction" do
    assert_difference('OutstandingTransaction.count', -1) do
      delete :destroy, id: @outstanding_transaction
    end

    assert_redirected_to outstanding_transactions_path
  end
end

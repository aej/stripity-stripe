defmodule Stripe.Refund do
  use Stripe.Entity

  @moduledoc "`Refund` objects allow you to refund a charge that has previously been created\nbut not yet refunded. Funds will be refunded to the credit or debit card that\nwas originally charged.\n\nRelated guide: [Refunds](https://stripe.com/docs/refunds)"
  (
    defstruct [
      :amount,
      :balance_transaction,
      :charge,
      :created,
      :currency,
      :description,
      :failure_balance_transaction,
      :failure_reason,
      :id,
      :instructions_email,
      :metadata,
      :next_action,
      :object,
      :payment_intent,
      :reason,
      :receipt_number,
      :source_transfer_reversal,
      :status,
      :transfer_reversal
    ]

    @typedoc "The `refund` type.\n\n  * `amount` Amount, in cents (or local equivalent).\n  * `balance_transaction` Balance transaction that describes the impact on your account balance.\n  * `charge` ID of the charge that was refunded.\n  * `created` Time at which the object was created. Measured in seconds since the Unix epoch.\n  * `currency` Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).\n  * `description` An arbitrary string attached to the object. Often useful for displaying to users. (Available on non-card refunds only)\n  * `failure_balance_transaction` If the refund failed, this balance transaction describes the adjustment made on your account balance that reverses the initial balance transaction.\n  * `failure_reason` If the refund failed, the reason for refund failure if known. Possible values are `lost_or_stolen_card`, `expired_or_canceled_card`, `charge_for_pending_refund_disputed`, `insufficient_funds`, `declined`, `merchant_request` or `unknown`.\n  * `id` Unique identifier for the object.\n  * `instructions_email` For payment methods without native refund support (e.g., Konbini, PromptPay), email for the customer to receive refund instructions.\n  * `metadata` Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.\n  * `next_action` \n  * `object` String representing the object's type. Objects of the same type share the same value.\n  * `payment_intent` ID of the PaymentIntent that was refunded.\n  * `reason` Reason for the refund, either user-provided (`duplicate`, `fraudulent`, or `requested_by_customer`) or generated by Stripe internally (`expired_uncaptured_charge`).\n  * `receipt_number` This is the transaction number that appears on email receipts sent for this refund.\n  * `source_transfer_reversal` The transfer reversal that is associated with the refund. Only present if the charge came from another Stripe account. See the Connect documentation for details.\n  * `status` Status of the refund. For credit card refunds, this can be `pending`, `succeeded`, or `failed`. For other types of refunds, it can be `pending`, `requires_action`, `succeeded`, `failed`, or `canceled`. Refer to our [refunds](https://stripe.com/docs/refunds#failed-refunds) documentation for more details.\n  * `transfer_reversal` If the accompanying transfer was reversed, the transfer reversal object. Only applicable if the charge was created using the destination parameter.\n"
    @type t :: %__MODULE__{
            amount: integer,
            balance_transaction: (binary | Stripe.BalanceTransaction.t()) | nil,
            charge: (binary | Stripe.Charge.t()) | nil,
            created: integer,
            currency: binary,
            description: binary,
            failure_balance_transaction: binary | Stripe.BalanceTransaction.t(),
            failure_reason: binary,
            id: binary,
            instructions_email: binary,
            metadata: term | nil,
            next_action: term,
            object: binary,
            payment_intent: (binary | Stripe.PaymentIntent.t()) | nil,
            reason: binary | nil,
            receipt_number: binary | nil,
            source_transfer_reversal: (binary | Stripe.TransferReversal.t()) | nil,
            status: binary | nil,
            transfer_reversal: (binary | Stripe.TransferReversal.t()) | nil
          }
  )

  (
    nil

    @doc "<p>You can see a list of the refunds belonging to a specific charge. Note that the 10 most recent refunds are always available by default on the charge object. If you need more than those 10, you can use this API method and the <code>limit</code> and <code>starting_after</code> parameters to page through additional refunds.</p>\n\n#### Details\n\n * Method: `get`\n * Path: `/v1/charges/{charge}/refunds`\n"
    (
      @spec list(
              charge :: binary(),
              params :: %{
                optional(:ending_before) => binary,
                optional(:expand) => list(binary),
                optional(:limit) => integer,
                optional(:starting_after) => binary
              },
              opts :: Keyword.t()
            ) ::
              {:ok, Stripe.List.t(Stripe.Refund.t())}
              | {:error, Stripe.ApiErrors.t()}
              | {:error, term()}
      def list(charge, params \\ %{}, opts \\ []) do
        path =
          Stripe.OpenApi.Path.replace_path_params(
            "/v1/charges/{charge}/refunds",
            [
              %OpenApiGen.Blueprint.Parameter{
                in: "path",
                name: "charge",
                required: true,
                schema: %OpenApiGen.Blueprint.Parameter.Schema{
                  name: "charge",
                  title: nil,
                  type: "string",
                  items: [],
                  properties: [],
                  any_of: []
                }
              }
            ],
            [charge]
          )

        Stripe.Request.new_request(opts)
        |> Stripe.Request.put_endpoint(path)
        |> Stripe.Request.put_params(params)
        |> Stripe.Request.put_method(:get)
        |> Stripe.Request.make_request()
      end
    )
  )

  (
    nil

    @doc "<p>Retrieves the details of an existing refund.</p>\n\n#### Details\n\n * Method: `get`\n * Path: `/v1/charges/{charge}/refunds/{refund}`\n"
    (
      @spec retrieve(
              charge :: binary(),
              refund :: binary(),
              params :: %{optional(:expand) => list(binary)},
              opts :: Keyword.t()
            ) :: {:ok, Stripe.Refund.t()} | {:error, Stripe.ApiErrors.t()} | {:error, term()}
      def retrieve(charge, refund, params \\ %{}, opts \\ []) do
        path =
          Stripe.OpenApi.Path.replace_path_params(
            "/v1/charges/{charge}/refunds/{refund}",
            [
              %OpenApiGen.Blueprint.Parameter{
                in: "path",
                name: "charge",
                required: true,
                schema: %OpenApiGen.Blueprint.Parameter.Schema{
                  name: "charge",
                  title: nil,
                  type: "string",
                  items: [],
                  properties: [],
                  any_of: []
                }
              },
              %OpenApiGen.Blueprint.Parameter{
                in: "path",
                name: "refund",
                required: true,
                schema: %OpenApiGen.Blueprint.Parameter.Schema{
                  name: "refund",
                  title: nil,
                  type: "string",
                  items: [],
                  properties: [],
                  any_of: []
                }
              }
            ],
            [charge, refund]
          )

        Stripe.Request.new_request(opts)
        |> Stripe.Request.put_endpoint(path)
        |> Stripe.Request.put_params(params)
        |> Stripe.Request.put_method(:get)
        |> Stripe.Request.make_request()
      end
    )
  )

  (
    nil
    @doc "<p>Create a refund.</p>\n\n#### Details\n\n * Method: `post`\n * Path: `/v1/refunds`\n"
    (
      @spec create(
              params :: %{
                optional(:amount) => integer,
                optional(:charge) => binary,
                optional(:currency) => binary,
                optional(:customer) => binary,
                optional(:expand) => list(binary),
                optional(:instructions_email) => binary,
                optional(:metadata) => %{optional(binary) => binary} | binary,
                optional(:origin) => :customer_balance,
                optional(:payment_intent) => binary,
                optional(:reason) => :duplicate | :fraudulent | :requested_by_customer,
                optional(:refund_application_fee) => boolean,
                optional(:reverse_transfer) => boolean
              },
              opts :: Keyword.t()
            ) :: {:ok, Stripe.Refund.t()} | {:error, Stripe.ApiErrors.t()} | {:error, term()}
      def create(params \\ %{}, opts \\ []) do
        path = Stripe.OpenApi.Path.replace_path_params("/v1/refunds", [], [])

        Stripe.Request.new_request(opts)
        |> Stripe.Request.put_endpoint(path)
        |> Stripe.Request.put_params(params)
        |> Stripe.Request.put_method(:post)
        |> Stripe.Request.make_request()
      end
    )
  )

  (
    nil

    @doc "<p>Updates the specified refund by setting the values of the parameters passed. Any parameters not provided will be left unchanged.</p>\n\n<p>This request only accepts <code>metadata</code> as an argument.</p>\n\n#### Details\n\n * Method: `post`\n * Path: `/v1/refunds/{refund}`\n"
    (
      @spec update(
              refund :: binary(),
              params :: %{
                optional(:expand) => list(binary),
                optional(:metadata) => %{optional(binary) => binary} | binary
              },
              opts :: Keyword.t()
            ) :: {:ok, Stripe.Refund.t()} | {:error, Stripe.ApiErrors.t()} | {:error, term()}
      def update(refund, params \\ %{}, opts \\ []) do
        path =
          Stripe.OpenApi.Path.replace_path_params(
            "/v1/refunds/{refund}",
            [
              %OpenApiGen.Blueprint.Parameter{
                in: "path",
                name: "refund",
                required: true,
                schema: %OpenApiGen.Blueprint.Parameter.Schema{
                  name: "refund",
                  title: nil,
                  type: "string",
                  items: [],
                  properties: [],
                  any_of: []
                }
              }
            ],
            [refund]
          )

        Stripe.Request.new_request(opts)
        |> Stripe.Request.put_endpoint(path)
        |> Stripe.Request.put_params(params)
        |> Stripe.Request.put_method(:post)
        |> Stripe.Request.make_request()
      end
    )
  )

  (
    nil

    @doc "<p>Cancels a refund with a status of <code>requires_action</code>.</p>\n\n<p>Refunds in other states cannot be canceled, and only refunds for payment methods that require customer action will enter the <code>requires_action</code> state.</p>\n\n#### Details\n\n * Method: `post`\n * Path: `/v1/refunds/{refund}/cancel`\n"
    (
      @spec cancel(
              refund :: binary(),
              params :: %{optional(:expand) => list(binary)},
              opts :: Keyword.t()
            ) :: {:ok, Stripe.Refund.t()} | {:error, Stripe.ApiErrors.t()} | {:error, term()}
      def cancel(refund, params \\ %{}, opts \\ []) do
        path =
          Stripe.OpenApi.Path.replace_path_params(
            "/v1/refunds/{refund}/cancel",
            [
              %OpenApiGen.Blueprint.Parameter{
                in: "path",
                name: "refund",
                required: true,
                schema: %OpenApiGen.Blueprint.Parameter.Schema{
                  name: "refund",
                  title: nil,
                  type: "string",
                  items: [],
                  properties: [],
                  any_of: []
                }
              }
            ],
            [refund]
          )

        Stripe.Request.new_request(opts)
        |> Stripe.Request.put_endpoint(path)
        |> Stripe.Request.put_params(params)
        |> Stripe.Request.put_method(:post)
        |> Stripe.Request.make_request()
      end
    )
  )

  (
    nil

    @doc "<p>Expire a refund with a status of <code>requires_action</code>.</p>\n\n#### Details\n\n * Method: `post`\n * Path: `/v1/test_helpers/refunds/{refund}/expire`\n"
    (
      @spec expire(
              refund :: binary(),
              params :: %{optional(:expand) => list(binary)},
              opts :: Keyword.t()
            ) :: {:ok, Stripe.Refund.t()} | {:error, Stripe.ApiErrors.t()} | {:error, term()}
      def expire(refund, params \\ %{}, opts \\ []) do
        path =
          Stripe.OpenApi.Path.replace_path_params(
            "/v1/test_helpers/refunds/{refund}/expire",
            [
              %OpenApiGen.Blueprint.Parameter{
                in: "path",
                name: "refund",
                required: true,
                schema: %OpenApiGen.Blueprint.Parameter.Schema{
                  name: "refund",
                  title: nil,
                  type: "string",
                  items: [],
                  properties: [],
                  any_of: []
                }
              }
            ],
            [refund]
          )

        Stripe.Request.new_request(opts)
        |> Stripe.Request.put_endpoint(path)
        |> Stripe.Request.put_params(params)
        |> Stripe.Request.put_method(:post)
        |> Stripe.Request.make_request()
      end
    )
  )
end

namespace :test do
  task lib: "test:prepare" do
    $: << "test"
    Minitest.rake_run(["test/lib"])
  end

  task units: "test:prepare" do
    $: << "test"
    Minitest.rake_run(["test/models", "test/helpers", "test/unit", "test/lib"])
  end
end
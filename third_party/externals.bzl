load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")
load("//third_party/cargo:crates.bzl", "raze_fetch_remote_crates")

# We define our externals here instead of directly in WORKSPACE
def register_sorbet_dependencies():
    http_archive(
        name = "doctest",
        urls = _github_public_urls("onqtam/doctest/archive/7d42bd0fab6c44010c8aed9338bd02bea5feba41.zip"),
        sha256 = "b33c8e954d15a146bb744ca29f4ca204b955530f52b2f8a895746a99cee4f2df",
        build_file = "@com_stripe_ruby_typer//third_party:doctest.BUILD",
        strip_prefix = "doctest-7d42bd0fab6c44010c8aed9338bd02bea5feba41",
    )

    http_archive(
        name = "dtl",
        urls = _github_public_urls("cubicdaiya/dtl/archive/v1.19.tar.gz"),
        sha256 = "f47b99dd11e5d771ad32a8dc960db4ab2fbe349fb0346fa0795f53c846a99c5d",
        build_file = "@com_stripe_ruby_typer//third_party:dtl.BUILD",
        strip_prefix = "dtl-1.19",
    )

    http_archive(
        name = "yaml_cpp",
        urls = _github_public_urls("jbeder/yaml-cpp/archive/yaml-cpp-0.6.3.zip"),
        sha256 = "7c0ddc08a99655508ae110ba48726c67e4a10b290c214aed866ce4bbcbe3e84c",
        build_file = "@com_stripe_ruby_typer//third_party:yaml_cpp.BUILD",
        strip_prefix = "yaml-cpp-yaml-cpp-0.6.3",
    )

    http_archive(
        name = "spdlog",
        urls = _github_public_urls("gabime/spdlog/archive/c2b47430fb210c8822177407b9e4b82d4ef7455d.zip"),  # v1.3.1
        sha256 = "08b7e0f1d7c62a56dfbac5678979967690ccd9e074acd3762a2a49d8731961e6",
        build_file = "@com_stripe_ruby_typer//third_party:spdlog.BUILD",
        strip_prefix = "spdlog-c2b47430fb210c8822177407b9e4b82d4ef7455d",
    )

    # proto_library, cc_proto_library, and java_proto_library rules implicitly
    # depend on @com_google_protobuf for protoc and proto runtimes.
    # This statement defines the @com_google_protobuf repo.
    http_archive(
        name = "com_google_protobuf",
        urls = _github_public_urls("protocolbuffers/protobuf/archive/v3.11.4.zip"),
        sha256 = "9748c0d90e54ea09e5e75fb7fac16edce15d2028d4356f32211cfa3c0e956564",
        strip_prefix = "protobuf-3.11.4",
    )

    http_archive(
        name = "libprotobuf-mutator",
        urls = _github_public_urls("google/libprotobuf-mutator/archive/68e10c13248517c5bcd531d0e02be483da83fc13.zip"),
        sha256 = "8684276b996e8d8541ed3703420f9dbcc17702bd7b13c6f3d9c13a4656597c76",
        build_file = "@com_stripe_ruby_typer//third_party:libprotobuf-mutator.BUILD",
        strip_prefix = "libprotobuf-mutator-68e10c13248517c5bcd531d0e02be483da83fc13",
    )

    http_archive(
        name = "lmdb",
        urls = _github_public_urls("DarkDimius/lmdb/archive/75766ec2b663b360be8eea9730a7adc0d252ce7e.zip"),
        sha256 = "bd120470d62c6f3433f80bb9841f09f158924081eb0c3236da6e8d1a0976eccc",
        build_file = "@com_stripe_ruby_typer//third_party:lmdb.BUILD",
        strip_prefix = "lmdb-75766ec2b663b360be8eea9730a7adc0d252ce7e",
    )

    http_archive(
        name = "rapidjson",
        urls = _github_public_urls("Tencent/rapidjson/archive/f376690822cbc2d17044e626be5df21f7d91ca8f.zip"),
        sha256 = "9425276583dff9020cee6332472b0cf247ae325cb5f26dbe157183f747da3910",
        build_file = "@com_stripe_ruby_typer//third_party:rapidjson.BUILD",
        strip_prefix = "rapidjson-f376690822cbc2d17044e626be5df21f7d91ca8f",
    )

    http_archive(
        name = "lizard",
        urls = _github_public_urls("inikep/lizard/archive/dda3b335e92ecd5caceccc9c577b39dd4e3c9950.zip"),
        sha256 = "1d4e8c17d40ec56b7ecad60bcf4a9065df73d7e5997f78e75dbe5fc662ce6aa8",
        build_file = "@com_stripe_ruby_typer//third_party:lizard.BUILD",
        strip_prefix = "lizard-dda3b335e92ecd5caceccc9c577b39dd4e3c9950",
    )

    http_archive(
        name = "pdqsort",
        urls = _github_public_urls("orlp/pdqsort/archive/08879029ab8dcb80a70142acb709e3df02de5d37.zip"),
        sha256 = "ad8c9cd3d1abe5d566bad341bcce327a2e897b64236a7f9e74f4b9b0e7e5dc39",
        build_file = "@com_stripe_ruby_typer//third_party:pdqsort.BUILD",
        strip_prefix = "pdqsort-08879029ab8dcb80a70142acb709e3df02de5d37",
    )

    http_archive(
        name = "jemalloc",
        urls = _github_public_urls("jemalloc/jemalloc/archive/ea6b3e973b477b8061e0076bb257dbd7f3faa756.zip"),  # 5.2.1
        sha256 = "7822c5cb2d06a2665cdbbcd5d949f09b92ef5b891ad8354c6382a3614c9cc9cc",
        build_file = "@com_stripe_ruby_typer//third_party:jemalloc.BUILD",
        strip_prefix = "jemalloc-ea6b3e973b477b8061e0076bb257dbd7f3faa756",
    )

    http_archive(
        name = "concurrentqueue",
        urls = _github_public_urls("cameron314/concurrentqueue/archive/79cec4c3bf1ca23ea4a03adfcd3c2c3659684dd2.zip"),
        sha256 = "a78ff232e2996927ad6fbd015d1f15dfb20bf524a87ce2893e64dbbe1f04051e",
        build_file = "@com_stripe_ruby_typer//third_party:concurrentqueue.BUILD",
        strip_prefix = "concurrentqueue-79cec4c3bf1ca23ea4a03adfcd3c2c3659684dd2",
    )

    http_archive(
        name = "statsd",
        urls = _github_public_urls("romanbsd/statsd-c-client/archive/08ecca678345f157e72a1db1446facb403cbeb65.zip"),
        sha256 = "825395556fb553383173e47dbce98165981d100587993292ec9d174ec40a7ba1",
        build_file = "@com_stripe_ruby_typer//third_party:statsd.BUILD",
        strip_prefix = "statsd-c-client-08ecca678345f157e72a1db1446facb403cbeb65",
    )

    http_archive(
        name = "cxxopts",
        urls = _github_public_urls("jarro2783/cxxopts/archive/b0f67a06de3446aa97a4943ad0ad6086460b2b61.zip"),
        sha256 = "8635d7305e6623e7f4c635dae901891eb1151cee3106445d124c696361bb70fc",
        build_file = "@com_stripe_ruby_typer//third_party:cxxopts.BUILD",
        strip_prefix = "cxxopts-b0f67a06de3446aa97a4943ad0ad6086460b2b61",
    )

    http_archive(
        name = "rang",
        urls = _github_public_urls("agauniyal/rang/archive/v3.1.0.zip"),
        sha256 = "658adeb8a36d36981d4339fc839f2deedc0e75cb421db1982041d8a0a255835d",
        build_file = "@com_stripe_ruby_typer//third_party:rang.BUILD",
        strip_prefix = "rang-3.1.0",
    )

    http_archive(
        name = "com_google_absl",
        urls = _github_public_urls("abseil/abseil-cpp/archive/62f05b1f57ad660e9c09e02ce7d591dcc4d0ca08.zip"),
        sha256 = "afcab9f226ac4ca6b6b7c9ec704a995fe32a6b555d6935b0de247ae6ac6940e0",
        strip_prefix = "abseil-cpp-62f05b1f57ad660e9c09e02ce7d591dcc4d0ca08",
    )

    http_archive(
        name = "compdb",
        urls = _github_public_urls("grailbio/bazel-compilation-database/archive/0ae6349c52700f060c9a87c5ed2b04b75f94a26f.zip"),
        sha256 = "40ad122fedbf2d8b23e70e16b5f49c1a316f02db3ed29ce1af8650dad6ccc1a9",
        build_file_content = (
            """
package(default_visibility = ["//visibility:public"])
"""
        ),
        strip_prefix = "bazel-compilation-database-0ae6349c52700f060c9a87c5ed2b04b75f94a26f",
    )

    # NOTE: we use the sorbet branch for development to keep our changes rebasable on grailio/bazel-toolchain
    http_archive(
        name = "com_grail_bazel_toolchain",
        urls = _github_public_urls("sorbet/bazel-toolchain/archive/ff9ded642e9d8eb2a329f59adcaa3fa5bdb3249c.zip"),
        sha256 = "a99293bea4549e3ddd1cc0a3307822c719c5ef482707d192be2060051d4505b3",
        strip_prefix = "bazel-toolchain-ff9ded642e9d8eb2a329f59adcaa3fa5bdb3249c",
    )

    http_archive(
        name = "io_bazel_rules_go",
        urls = _github_public_urls("bazelbuild/rules_go/archive/dd4fb4f8128b83f189f7bdda663e65b915a6d3c4.zip"),
        sha256 = "ea702009018b6a5d6665808a4d1f54e2f40a2938e3946e98de00d38b34fd8a27",
        strip_prefix = "rules_go-dd4fb4f8128b83f189f7bdda663e65b915a6d3c4",
    )

    http_archive(
        name = "com_github_bazelbuild_buildtools",
        urls = _github_public_urls("bazelbuild/buildtools/archive/5bcc31df55ec1de770cb52887f2e989e7068301f.zip"),
        sha256 = "875d0c49953e221cfc35d2a3846e502f366dfa4024b271fa266b186ca4664b37",
        strip_prefix = "buildtools-5bcc31df55ec1de770cb52887f2e989e7068301f",
    )

    # optimized version of blake2 hashing algorithm
    http_archive(
        name = "com_github_blake2_libb2",
        urls = _github_public_urls("BLAKE2/libb2/archive/fa83ddbe179912e9a7a57edf0333b33f6ff83056.zip"),
        sha256 = "dd25f7ac53371c2a15761fc1689d04de2ff948ac7e213a10d13961e24b0c9ae6",
        build_file = "@com_stripe_ruby_typer//third_party:libb2.BUILD",
        strip_prefix = "libb2-fa83ddbe179912e9a7a57edf0333b33f6ff83056",
    )

    # portable reference implementation of blake2
    http_archive(
        name = "com_github_blake2_blake2",
        urls = _github_public_urls("BLAKE2/BLAKE2/archive/997fa5ba1e14b52c554fb03ce39e579e6f27b90c.zip"),
        sha256 = "56dafe9512f65728ce7abc78900272f8bf8e95ca04439b362d2dc461927b2a17",
        build_file = "@com_stripe_ruby_typer//third_party:blake2.BUILD",
        strip_prefix = "BLAKE2-997fa5ba1e14b52c554fb03ce39e579e6f27b90c",
    )

    http_archive(
        name = "com_github_ludocode_mpack",
        urls = _github_public_urls("ludocode/mpack/archive/6883f6f8067d5c6dbaaddeaa47aaaaa763eea51c.zip"),
        sha256 = "fb184dc169722cecf9b47bece308f70861787f4615ebdbee7383b6434cfdbc0d",
        build_file = "@com_stripe_ruby_typer//third_party:mpack.BUILD",
        strip_prefix = "mpack-6883f6f8067d5c6dbaaddeaa47aaaaa763eea51c",
    )

    http_archive(
        name = "com_github_d_bahr_crcpp",
        urls = _github_public_urls("d-bahr/CRCpp/archive/51fbc35ef892e98abe91a51f7320749c929d72bd.zip"),
        sha256 = "57c4c127b5aa4451556969d6929cf9465a5d5481b3442ddb878d95296caeee4b",
        build_file = "@com_stripe_ruby_typer//third_party:crcpp.BUILD",
        strip_prefix = "CRCpp-51fbc35ef892e98abe91a51f7320749c929d72bd",
    )

    http_archive(
        name = "emscripten_toolchain",
        urls = _github_public_urls("kripken/emscripten/archive/1.38.25.tar.gz"),
        build_file = "@com_stripe_ruby_typer//third_party:emscripten-toolchain.BUILD",
        sha256 = "4d6fa350895fabc25b89ce5f9dcb528e719e7c2bf7dacab2a3e3cc818ecd7019",
        strip_prefix = "emscripten-1.38.25",
    )

    http_archive(
        name = "emscripten_clang_linux",
        urls = _emscripten_urls("linux/emscripten-llvm-e1.38.25.tar.gz"),
        build_file = "@com_stripe_ruby_typer//third_party:emscripten-clang.BUILD",
        sha256 = "0e9a5a114a60c21604f4038b573109bd31424aeba275b4173480485ca0a56ba4",
        strip_prefix = "emscripten-llvm-e1.38.25",
    )

    http_archive(
        name = "emscripten_clang_darwin",
        urls = _emscripten_urls("mac/emscripten-llvm-e1.38.25.tar.gz"),
        build_file = "@com_stripe_ruby_typer//third_party:emscripten-clang.BUILD",
        sha256 = "01519125c613d0b013193eaf5ac5031e6ec34aac2451c357fd4097874ceee38c",
        strip_prefix = "emscripten-llvm-e1.38.25",
    )

    http_archive(
        name = "rules_ragel",
        urls = _github_public_urls("jmillikin/rules_ragel/archive/f99f17fcad2e155646745f4827ac636a3b5d4d15.zip"),
        sha256 = "f957682c6350b2e4484c433c7f45d427a86de5c8751a0d2a9836f36995fe0320",
        strip_prefix = "rules_ragel-f99f17fcad2e155646745f4827ac636a3b5d4d15",
    )

    http_archive(
        name = "rules_bison",
        urls = _github_public_urls("jmillikin/rules_bison/releases/download/v0.2/rules_bison-v0.2.tar.xz"),
        sha256 = "6ee9b396f450ca9753c3283944f9a6015b61227f8386893fb59d593455141481",
    )

    http_archive(
        name = "rules_m4",
        urls = _github_public_urls("jmillikin/rules_m4/releases/download/v0.2/rules_m4-v0.2.tar.xz"),
        sha256 = "c67fa9891bb19e9e6c1050003ba648d35383b8cb3c9572f397ad24040fb7f0eb",
    )

    http_archive(
        name = "cpp_subprocess",
        urls = _github_public_urls("arun11299/cpp-subprocess/archive/9c624ce4e3423cce9f148bafbae56abfd6437ea0.zip"),
        sha256 = "1810d1ec80f3c319dcbb530443b264b9a32a449b5a5d3630076e473648bba8cc",
        build_file = "@com_stripe_ruby_typer//third_party:cpp_subprocess.BUILD",
        strip_prefix = "cpp-subprocess-9c624ce4e3423cce9f148bafbae56abfd6437ea0",
    )

    http_file(
        name = "bundler_2_1_4",
        urls = _rubygems_urls("bundler-2.1.4.gem"),
        sha256 = "50014d21d6712079da4d6464de12bb93c278f87c9200d0b60ba99f32c25af489",
    )

    http_archive(
        name = "ruby_2_5",
        urls = _ruby_urls("2.5/ruby-2.5.8.tar.gz"),
        sha256 = "6c0bdf07876c69811a9e7dc237c43d40b1cb6369f68e0e17953d7279b524ad9a",
        strip_prefix = "ruby-2.5.8",
        build_file = "@com_stripe_ruby_typer//third_party/ruby:ruby.BUILD",
    )

    http_archive(
        name = "ruby_2_6",
        urls = _ruby_urls("2.6/ruby-2.6.5.tar.gz"),
        sha256 = "66976b716ecc1fd34f9b7c3c2b07bbd37631815377a2e3e85a5b194cfdcbed7d",
        strip_prefix = "ruby-2.6.5",
        build_file = "@com_stripe_ruby_typer//third_party/ruby:ruby.BUILD",
    )

    native.new_local_repository(
        name = "system_ssl_darwin",
        path = "/usr/local/opt/openssl",
        build_file = "@com_stripe_ruby_typer//third_party/openssl:darwin.BUILD",
    )

    native.new_local_repository(
        name = "system_ssl_linux",
        path = "/usr",
        build_file = "@com_stripe_ruby_typer//third_party/openssl:linux.BUILD",
    )

    http_archive(
        name = "rubyfmt",
        build_file = "@com_stripe_ruby_typer//third_party/rubyfmt:rubyfmt.BUILD",
        urls = _github_public_urls("penelopezone/rubyfmt/releases/download/v0.5.0/rubyfmt-v0.5.0-sources.tar.gz"),
        sha256 = "b2ac743da7c0a0d8dca9d452576d9731356be264fb308ee614bf5eff90a802dd",
    )

    http_archive(
        name = "io_bazel_rules_rust",
        sha256 = "5ed804fcd10a506a5b8e9e59bc6b3b7f43bc30c87ce4670e6f78df43604894fd",
        strip_prefix = "rules_rust-fdf9655ba95616e0314b4e0ebab40bb0c5fe005c",

        # Master branch as of 2019-10-07
        urls = _github_public_urls("bazelbuild/rules_rust/archive/fdf9655ba95616e0314b4e0ebab40bb0c5fe005c.tar.gz"),
    )

    http_archive(
        name = "bazel_skylib",
        sha256 = "9a737999532daca978a158f94e77e9af6a6a169709c0cee274f0a4c3359519bd",
        strip_prefix = "bazel-skylib-1.0.0",
        urls = _github_public_urls("bazelbuild/bazel-skylib/archive/1.0.0.tar.gz"),
    )

    raze_fetch_remote_crates()

def _github_public_urls(path):
    """
    Produce a url list that works both with github, and stripe's internal artifact cache.
    """
    return [
        "https://github.com/{}".format(path),
        "https://artifactory-content.stripe.build/artifactory/github-archives/{}".format(path),
    ]

def _emscripten_urls(path):
    """
    Produce a url list that works both with emscripten, and stripe's internal artifact cache.
    """
    return [
        "https://storage.googleapis.com/webassembly/emscripten-releases-builds/old/{}".format(path),
        "https://artifactory-content.stripe.build/artifactory/googleapis-storage-cache/webassembly/emscripten-releases-builds/old/{}".format(path),
    ]

def _rubygems_urls(gem):
    """
    Produce a url list that works both with rubygems, and stripe's internal gem cache.
    """
    return [
        "https://rubygems.org/downloads/{}".format(gem),
        "https://artifactory-content.stripe.build/artifactory/gems/gems/{}".format(gem),
    ]

def _ruby_urls(path):
    """
    Produce a url list that works both with ruby-lang.org, and stripe's internal artifact cache.
    """
    return [
        "https://cache.ruby-lang.org/pub/ruby/{}".format(path),
        "https://artifactory-content.stripe.build/artifactory/ruby-lang-cache/pub/ruby/{}".format(path),
    ]

require "language/node"

class CubejsCli < Formula
  desc "Cube.js command-line interface"
  homepage "https://cube.dev/"
  url "https://registry.npmjs.org/cubejs-cli/-/cubejs-cli-0.31.7.tgz"
  sha256 "254e76862ea2d498582c17379c9ca1762c4233fddf25636bb3618e01fa3f4c3a"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "9453efb842f2a2ed94cfec5baa587761457bf1a95b371a9cff7df09ff82cf553"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "9453efb842f2a2ed94cfec5baa587761457bf1a95b371a9cff7df09ff82cf553"
    sha256 cellar: :any_skip_relocation, monterey:       "96999108878af9c63a743d18d31f093d407952766057f6889f41abf1ced49cfc"
    sha256 cellar: :any_skip_relocation, big_sur:        "96999108878af9c63a743d18d31f093d407952766057f6889f41abf1ced49cfc"
    sha256 cellar: :any_skip_relocation, catalina:       "96999108878af9c63a743d18d31f093d407952766057f6889f41abf1ced49cfc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "9453efb842f2a2ed94cfec5baa587761457bf1a95b371a9cff7df09ff82cf553"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cubejs --version")
    system "cubejs", "create", "hello-world", "-d", "postgres"
    assert_predicate testpath/"hello-world/schema/Orders.js", :exist?
  end
end

require "language/node"

class Whistle < Formula
  desc "HTTP, HTTP2, HTTPS, Websocket debugging proxy"
  homepage "https://github.com/avwo/whistle"
  url "https://registry.npmjs.org/whistle/-/whistle-2.9.34.tgz"
  sha256 "51c1e0c8425e651eecf54984cafe67cca06f58994fe7b5f7c96ffd4ab31ff20a"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "7d5ed150d6084f53eab22e190bd62ce772ae4bfdc32a42d0dc3d587847e6671e"
  end

  # `bin/proxy/mac/Whistle` was only built for `x86_64`
  # upstream issue tracker, https://github.com/avwo/whistle/issues/734
  depends_on arch: :x86_64
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"package.json").write('{"name": "test"}')
    system bin/"whistle", "start"
    system bin/"whistle", "stop"
  end
end

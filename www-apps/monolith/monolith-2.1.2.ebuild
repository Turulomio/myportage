EAPI=7

inherit cargo eutils

#Must be before SRC_URI

CRATES="
adler32-1.0.4
aho-corasick-0.7.6
ansi_term-0.11.0
anyhow-1.0.26
async-compression-0.2.0
atty-0.2.13
autocfg-0.1.7
base64-0.10.1
base64-0.11.0
bitflags-1.2.1
bumpalo-3.1.1
byteorder-1.3.2
bytes-0.5.3
c2-chacha-0.2.3
cc-1.0.47
cfg-if-0.1.10
clap-2.33.0
cloudabi-0.0.3
core-foundation-0.6.4
core-foundation-sys-0.6.2
crc32fast-1.2.0
dtoa-0.4.4
encoding_rs-0.8.20
flate2-1.0.13
fnv-1.0.6
foreign-types-0.3.2
foreign-types-shared-0.1.1
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futf-0.1.4
futures-channel-0.3.1
futures-core-0.3.1
futures-io-0.3.1
futures-sink-0.3.1
futures-task-0.3.1
futures-util-0.3.1
getrandom-0.1.13
h2-0.2.1
heck-0.3.1
hermit-abi-0.1.6
html5ever-0.24.1
http-0.2.0
http-body-0.3.1
httparse-1.3.4
hyper-0.13.1
hyper-tls-0.4.0
idna-0.2.0
indexmap-1.3.0
iovec-0.1.4
itoa-0.4.4
js-sys-0.3.34
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.66
log-0.4.8
mac-0.1.1
markup5ever-0.9.0
matches-0.1.8
memchr-2.2.1
mime-0.3.14
mime_guess-2.0.1
miniz_oxide-0.3.5
mio-0.6.21
miow-0.2.1
native-tls-0.2.3
net2-0.2.33
new_debug_unreachable-1.0.3
nom-4.2.3
num_cpus-1.11.1
openssl-0.10.26
openssl-probe-0.1.2
openssl-sys-0.9.53
percent-encoding-2.1.0
phf-0.7.24
phf_codegen-0.7.24
phf_generator-0.7.24
phf_shared-0.7.24
pin-project-0.4.6
pin-project-internal-0.4.6
pin-project-lite-0.1.2
pin-utils-0.1.0-alpha.4
pkg-config-0.3.17
ppv-lite86-0.2.6
precomputed-hash-0.1.1
proc-macro2-1.0.6
quote-1.0.2
rand-0.6.5
rand-0.7.2
rand_chacha-0.1.1
rand_chacha-0.2.1
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_hc-0.1.0
rand_hc-0.2.0
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_pcg-0.1.2
rand_xorshift-0.1.1
rdrand-0.4.0
redox_syscall-0.1.56
regex-1.3.1
regex-syntax-0.6.12
remove_dir_all-0.5.2
reqwest-0.10.0
ryu-1.0.2
schannel-0.1.16
security-framework-0.3.4
security-framework-sys-0.3.3
serde-1.0.103
serde_derive-1.0.103
serde_json-1.0.42
serde_urlencoded-0.6.1
siphasher-0.2.3
slab-0.4.2
smallvec-1.0.0
sourcefile-0.1.4
string_cache-0.7.5
string_cache_codegen-0.4.4
string_cache_shared-0.3.0
strsim-0.8.0
syn-1.0.11
tempfile-3.1.0
tendril-0.4.1
textwrap-0.11.0
thread_local-0.3.6
time-0.1.42
tokio-0.2.6
tokio-tls-0.3.0
tokio-util-0.2.0
tower-service-0.3.0
try-lock-0.2.2
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.11
unicode-segmentation-1.6.0
unicode-width-0.1.6
unicode-xid-0.2.0
url-2.1.0
utf-8-0.7.5
vcpkg-0.2.8
vec_map-0.8.1
version_check-0.1.5
version_check-0.9.1
want-0.3.0
wasi-0.7.0
wasm-bindgen-0.2.57
wasm-bindgen-backend-0.2.57
wasm-bindgen-futures-0.4.7
wasm-bindgen-macro-0.2.57
wasm-bindgen-macro-support-0.2.57
wasm-bindgen-shared-0.2.57
wasm-bindgen-webidl-0.2.57
web-sys-0.3.34
weedle-0.10.0
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.6.2
ws2_32-sys-0.2.1
"

COMMIT="1e8348543af89604f2ae8f87b60fbaafc514da46"

DESCRIPTION="Save HTML pages with ease"
HOMEPAGE="https://github.com/Y2Z/monolith"

SRC_URI="$(cargo_crate_uris ${CRATES})
https://github.com/Y2Z/monolith/archive/$COMMIT.zip -> ${P}.zip
"


#LICENSE="UNLICENSE"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=">=virtual/rust-1.31.0"


#QA_FLAGS_IGNORED="/usr/bin/fblog"

S=${WORKDIR}/monolith-$COMMIT

src_install() {
	einfo $COMMIT
	cargo install --path=.
	einstalldocs
	dobin "${ECARGO_HOME}"/bin/monolith
}
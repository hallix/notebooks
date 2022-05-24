### A Pluto.jl notebook ###
# v0.19.5

using Markdown
using InteractiveUtils

# ╔═╡ 7932be38-8e27-4974-bb84-9119d44b6238
using DataFrames

# ╔═╡ 334ac826-720c-413c-a82f-b178cbaec07c
using CSV

# ╔═╡ f23ea0ff-76d4-479f-915f-9d55f3ca4ff7
using Pipe

# ╔═╡ d5478d95-cb2b-4b58-94cd-47d2e42d31d7
using VegaLite

# ╔═╡ c294b40e-3a71-41c4-94da-7c102cb9aece
dataset = DataFrame(CSV.File("dataset.csv")) |> dropmissing

# ╔═╡ 76ac1e82-924d-42a1-9aec-78673ad849db


# ╔═╡ cf2173f3-05bc-4b68-a391-a04c93f69f28
begin
	newNames = map(name -> replace(name, " " => "_"), names(dataset))
	rename!(dataset, newNames)
end

# ╔═╡ b4170d5b-9fe6-4db7-8d16-6a4d03b86a12
#Group music by top year

# ╔═╡ 00d5a3bb-ae5d-4b53-9d20-22ca5d5f4f50
year_trend = @pipe dataset |> groupby(_,:year_released)|> combine(_,nrow => :count)

# ╔═╡ dfc51d83-566f-4d5a-bed8-4a65fdf59e54


# ╔═╡ fd58fe96-aa96-4670-96d3-71fd48bdfc93


# ╔═╡ f99e4330-d1d2-4b3b-853a-2b79142a1b83
year_trend |>
	@vlplot(
		:bar,
		encoding={
        x={field=:year_released, type="ordinal"},
        y={field=:count, type="quantitative"}
	})

# ╔═╡ 1382a200-8c50-48e3-bb7e-a8c45462b6d9


# ╔═╡ 32daaa4c-6970-4de3-8b18-0a97d47437b4


# ╔═╡ 059ed042-365d-4633-8b27-9180907b124b


# ╔═╡ a3a6aff6-2ac4-45b2-9b1b-8d14593470a4


# ╔═╡ 3aee89c8-68b8-4858-9c26-adce17657936


# ╔═╡ 265a459a-b18f-4c49-a8bb-6fe72176ee91


# ╔═╡ 5c4e5425-09fd-48ef-b038-c0f114728a17


# ╔═╡ d7311ddb-f22d-4182-a35a-3a8a1bb77dc3


# ╔═╡ cb255b81-65ed-4b06-9737-3c79884e30db


# ╔═╡ 6e139c47-8531-4d9a-8df0-ee349db45968


# ╔═╡ 19ea8a25-e149-4041-bbca-c7661e1e2c4f


# ╔═╡ f6da6e02-c12b-4b02-bf20-25296f659b22


# ╔═╡ 9dd43bfd-afd7-46c7-a92f-664c3d45c25c


# ╔═╡ a9057d07-64b5-4356-a3f4-1205b3ec8eb1


# ╔═╡ f394baa1-9ac9-459c-9a7f-80d6a6a0c888


# ╔═╡ 38afa734-9e36-4466-974c-b3dcde1b215e


# ╔═╡ d049c8ac-9b12-4905-9685-764aed86bb91


# ╔═╡ 8bbd65d3-859d-4865-847d-524e51c0093c


# ╔═╡ 304c9ccf-4dfd-4ae9-86c4-63c1f1b2c824


# ╔═╡ e18fbd19-7c33-4ef2-aaa9-281f206bc82e


# ╔═╡ ce5e667a-a326-4c4b-ad45-371e1c8c875b


# ╔═╡ 1f0792ad-a02a-4c17-97c5-b6bf843cd158


# ╔═╡ e8bbb880-a3bb-41b8-9c65-6c3111772a20


# ╔═╡ 38889942-aa5f-4a3a-8b2e-22de8bdb077e


# ╔═╡ a616f640-a34f-4585-9a39-e15deebd6ace


# ╔═╡ 973ebd13-71e5-4f9c-a34c-1a8a6b704abf


# ╔═╡ 5e30c00d-714d-499d-94cd-fe6594c0e297


# ╔═╡ ca79452f-62f6-4f98-a6f1-b038bb29678b


# ╔═╡ 027e21a4-1447-4248-8747-39ee45a19261


# ╔═╡ ecc8f789-caf2-4d82-a768-09347acbc120


# ╔═╡ 3a911179-6784-4353-b9e8-c933d48016c5


# ╔═╡ d14063ea-7049-46d0-a100-6a9db43870cc


# ╔═╡ 799ad4f1-9770-47e8-a05a-2d63b939777f


# ╔═╡ 03e1b7eb-9aad-4a6f-93d9-01aa3f15fd9c


# ╔═╡ baaa2f37-a120-4cfd-a3e0-98012039b073


# ╔═╡ ad95292b-af20-4661-9f3b-772d00087824


# ╔═╡ 3d6d5071-9be7-4b00-83df-66af58a572fe


# ╔═╡ d9ec3f56-a83d-4ab3-aafe-50085f0fbb9f


# ╔═╡ 376d9664-439a-495a-9c51-a3fffedf632a


# ╔═╡ afacfc10-5be5-40cf-bed6-be74764631f7


# ╔═╡ 88cc2521-bdde-4bc5-a5a6-7cdb62aca414


# ╔═╡ ab0b0fd5-a144-45a4-ab1d-7ec9b09a6b5e


# ╔═╡ b918be78-f23c-4d65-8fc1-82b46c4e101b


# ╔═╡ 4ee556fb-c27c-4375-9aaa-b71b0257751f


# ╔═╡ a09b03db-dcdb-4c9d-b438-91e1810a6b3a


# ╔═╡ 6a58c21f-0980-4ab0-a590-969edf3146d6


# ╔═╡ 828b6953-c8a1-4a30-b5a7-a4face5fba60


# ╔═╡ a2fff935-6d20-451b-a448-5519b39890b7


# ╔═╡ 4476df2f-b204-4287-82ca-459ff3f3bdba


# ╔═╡ cebf0eb2-e80c-45ca-9515-301924bf1e9b


# ╔═╡ f1a78e4c-e13c-461c-95c8-531b1e48ed36


# ╔═╡ f9d08f76-dd09-41fa-88f6-e70649c71066


# ╔═╡ 8a6ad7b4-81e9-4d7e-803e-5b276e96fd51


# ╔═╡ 8b3d9a60-5719-4ce6-8e44-20cd2f10c8a4


# ╔═╡ 97e4972b-7089-4445-ac39-efa3739eff95


# ╔═╡ 31ad5836-a49c-420f-b5e5-cdc1d3b395b0


# ╔═╡ 7d6f02eb-128a-4c09-9c3f-6d3f4ada3be7


# ╔═╡ 406851aa-791a-4e40-a866-b46301c66041


# ╔═╡ 10a1beb0-cbb6-422e-ab0a-b00feb4d7246


# ╔═╡ 71206b5d-7ef4-4ad9-8248-f2d3ea66ecc4


# ╔═╡ 9a1f4e59-f639-4c28-8ae4-0ba7784976e6


# ╔═╡ 6c76fd14-3624-493c-b7bc-92f4d04dd028


# ╔═╡ 320fed57-31bf-489c-ad14-6394c0f34786


# ╔═╡ 9f916a25-9b49-4900-9998-4ad76d669db2


# ╔═╡ 8b987aef-13c2-4b89-9173-c24a97935c64


# ╔═╡ 5395a886-96d5-4a99-a942-4fc06463cc59


# ╔═╡ a24ec33f-8224-4152-bd9b-b7d4452d0d18


# ╔═╡ f6272153-00e9-46e6-98b0-957fb5b5900e


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CSV = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
Pipe = "b98c9c47-44ae-5843-9183-064241ee97a0"
VegaLite = "112f6efa-9a02-5b7d-90c0-432ed331239a"

[compat]
CSV = "~0.10.4"
DataFrames = "~1.3.4"
Pipe = "~1.3.0"
VegaLite = "~2.6.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CSV]]
deps = ["CodecZlib", "Dates", "FilePathsBase", "InlineStrings", "Mmap", "Parsers", "PooledArrays", "SentinelArrays", "Tables", "Unicode", "WeakRefStrings"]
git-tree-sha1 = "873fb188a4b9d76549b81465b1f75c82aaf59238"
uuid = "336ed68f-0bac-5ca0-87d4-7b16caf5d00b"
version = "0.10.4"

[[deps.CodecZlib]]
deps = ["TranscodingStreams", "Zlib_jll"]
git-tree-sha1 = "ded953804d019afa9a3f98981d99b33e3db7b6da"
uuid = "944b1d66-785c-5afd-91f1-9de20f533193"
version = "0.7.0"

[[deps.Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "b153278a25dd42c65abbf4e62344f9d22e59191b"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.43.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f74e9d5388b8620b4cee35d4c5a618dd4dc547f4"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.0"

[[deps.Crayons]]
git-tree-sha1 = "249fe38abf76d48563e2f4556bebd215aa317e15"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.1.1"

[[deps.DataAPI]]
git-tree-sha1 = "fb5f5316dd3fd4c5e7c30a24d50643b73e37cd40"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.10.0"

[[deps.DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "daa21eb85147f72e41f6352a57fccea377e310a9"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.3.4"

[[deps.DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "cc1a8e22627f33c789ab60b36a9132ac050bbf75"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.12"

[[deps.DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[deps.DataValues]]
deps = ["DataValueInterfaces", "Dates"]
git-tree-sha1 = "d88a19299eba280a6d062e135a43f00323ae70bf"
uuid = "e7dc6d0d-1eca-5fa6-8ad6-5aecde8b7ea5"
version = "0.4.13"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[deps.FileIO]]
deps = ["Pkg", "Requires", "UUIDs"]
git-tree-sha1 = "9267e5f50b0e12fdfd5a2455534345c4cf2c7f7a"
uuid = "5789e2e9-d7fb-5bc7-8068-2c6fae9b9549"
version = "1.14.0"

[[deps.FilePaths]]
deps = ["FilePathsBase", "MacroTools", "Reexport", "Requires"]
git-tree-sha1 = "919d9412dbf53a2e6fe74af62a73ceed0bce0629"
uuid = "8fc22ac5-c921-52a6-82fd-178b2807b824"
version = "0.8.3"

[[deps.FilePathsBase]]
deps = ["Compat", "Dates", "Mmap", "Printf", "Test", "UUIDs"]
git-tree-sha1 = "129b104185df66e408edd6625d480b7f9e9823a0"
uuid = "48062228-2e41-5def-b9a4-89aafe57970f"
version = "0.9.18"

[[deps.Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[deps.Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[deps.HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[deps.IniFile]]
git-tree-sha1 = "f550e6e32074c939295eb5ea6de31849ac2c9625"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.1"

[[deps.InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "61feba885fac3a407465726d0c330b3055df897f"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.1.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[deps.IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.JSONSchema]]
deps = ["HTTP", "JSON", "URIs"]
git-tree-sha1 = "2f49f7f86762a0fbbeef84912265a1ae61c4ef80"
uuid = "7d188eb4-7ad8-530c-ae41-71a32a6d4692"
version = "0.3.4"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[deps.Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.NodeJS]]
deps = ["Pkg"]
git-tree-sha1 = "905224bbdd4b555c69bb964514cfa387616f0d3a"
uuid = "2bd173c7-0d6d-553b-b6af-13a54713934c"
version = "1.3.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "1285416549ccfcdf0c50d4997a94331e88d68413"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.3.1"

[[deps.Pipe]]
git-tree-sha1 = "6842804e7867b115ca9de748a0cf6b364523c16d"
uuid = "b98c9c47-44ae-5843-9183-064241ee97a0"
version = "1.3.0"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[deps.PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a6062fe4063cdafe78f4a0a81cfffb89721b30e7"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.2"

[[deps.PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "dfb54c4e414caa595a1f2ed759b160f5a3ddcba5"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.3.1"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "838a3a4188e2ded87a4f9f184b4b0d78a1e91cb7"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.3.0"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.SentinelArrays]]
deps = ["Dates", "Random"]
git-tree-sha1 = "6a2f7d70512d205ca8c7ee31bfa9f142fe74310c"
uuid = "91c51154-3ec4-41a3-a24f-3f23e20d615c"
version = "1.3.12"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Setfield]]
deps = ["ConstructionBase", "Future", "MacroTools", "Requires"]
git-tree-sha1 = "fca29e68c5062722b5b4435594c3d1ba557072a3"
uuid = "efcf1570-3423-57d1-acb7-fd33fddbac46"
version = "0.7.1"

[[deps.SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[deps.TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[deps.TableTraitsUtils]]
deps = ["DataValues", "IteratorInterfaceExtensions", "Missings", "TableTraits"]
git-tree-sha1 = "78fecfe140d7abb480b53a44f3f85b6aa373c293"
uuid = "382cd787-c1b6-5bf2-a167-d5b971a19bda"
version = "1.0.2"

[[deps.Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "OrderedCollections", "TableTraits", "Test"]
git-tree-sha1 = "5ce79ce186cc678bbb5c5681ca3379d1ddae11a1"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.7.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.TranscodingStreams]]
deps = ["Random", "Test"]
git-tree-sha1 = "216b95ea110b5972db65aa90f88d8d89dcb8851c"
uuid = "3bb67fe8-82b1-5028-8e26-92a6c54297fa"
version = "0.9.6"

[[deps.URIParser]]
deps = ["Unicode"]
git-tree-sha1 = "53a9f49546b8d2dd2e688d216421d050c9a31d0d"
uuid = "30578b45-9adc-5946-b283-645ec420af67"
version = "0.4.1"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Vega]]
deps = ["DataStructures", "DataValues", "Dates", "FileIO", "FilePaths", "IteratorInterfaceExtensions", "JSON", "JSONSchema", "MacroTools", "NodeJS", "Pkg", "REPL", "Random", "Setfield", "TableTraits", "TableTraitsUtils", "URIParser"]
git-tree-sha1 = "43f83d3119a868874d18da6bca0f4b5b6aae53f7"
uuid = "239c3e63-733f-47ad-beb7-a12fde22c578"
version = "2.3.0"

[[deps.VegaLite]]
deps = ["Base64", "DataStructures", "DataValues", "Dates", "FileIO", "FilePaths", "IteratorInterfaceExtensions", "JSON", "MacroTools", "NodeJS", "Pkg", "REPL", "Random", "TableTraits", "TableTraitsUtils", "URIParser", "Vega"]
git-tree-sha1 = "3e23f28af36da21bfb4acef08b144f92ad205660"
uuid = "112f6efa-9a02-5b7d-90c0-432ed331239a"
version = "2.6.0"

[[deps.WeakRefStrings]]
deps = ["DataAPI", "InlineStrings", "Parsers"]
git-tree-sha1 = "b1be2855ed9ed8eac54e5caff2afcdb442d52c23"
uuid = "ea10d353-3f73-51f8-a26c-33c1cb351aa5"
version = "1.4.2"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╠═7932be38-8e27-4974-bb84-9119d44b6238
# ╠═334ac826-720c-413c-a82f-b178cbaec07c
# ╠═f23ea0ff-76d4-479f-915f-9d55f3ca4ff7
# ╠═d5478d95-cb2b-4b58-94cd-47d2e42d31d7
# ╠═c294b40e-3a71-41c4-94da-7c102cb9aece
# ╠═76ac1e82-924d-42a1-9aec-78673ad849db
# ╠═cf2173f3-05bc-4b68-a391-a04c93f69f28
# ╠═b4170d5b-9fe6-4db7-8d16-6a4d03b86a12
# ╠═00d5a3bb-ae5d-4b53-9d20-22ca5d5f4f50
# ╠═dfc51d83-566f-4d5a-bed8-4a65fdf59e54
# ╠═fd58fe96-aa96-4670-96d3-71fd48bdfc93
# ╠═f99e4330-d1d2-4b3b-853a-2b79142a1b83
# ╠═1382a200-8c50-48e3-bb7e-a8c45462b6d9
# ╠═32daaa4c-6970-4de3-8b18-0a97d47437b4
# ╠═059ed042-365d-4633-8b27-9180907b124b
# ╠═a3a6aff6-2ac4-45b2-9b1b-8d14593470a4
# ╠═3aee89c8-68b8-4858-9c26-adce17657936
# ╠═265a459a-b18f-4c49-a8bb-6fe72176ee91
# ╠═5c4e5425-09fd-48ef-b038-c0f114728a17
# ╠═d7311ddb-f22d-4182-a35a-3a8a1bb77dc3
# ╠═cb255b81-65ed-4b06-9737-3c79884e30db
# ╠═6e139c47-8531-4d9a-8df0-ee349db45968
# ╠═19ea8a25-e149-4041-bbca-c7661e1e2c4f
# ╠═f6da6e02-c12b-4b02-bf20-25296f659b22
# ╠═9dd43bfd-afd7-46c7-a92f-664c3d45c25c
# ╠═a9057d07-64b5-4356-a3f4-1205b3ec8eb1
# ╠═f394baa1-9ac9-459c-9a7f-80d6a6a0c888
# ╠═38afa734-9e36-4466-974c-b3dcde1b215e
# ╠═d049c8ac-9b12-4905-9685-764aed86bb91
# ╠═8bbd65d3-859d-4865-847d-524e51c0093c
# ╠═304c9ccf-4dfd-4ae9-86c4-63c1f1b2c824
# ╠═e18fbd19-7c33-4ef2-aaa9-281f206bc82e
# ╠═ce5e667a-a326-4c4b-ad45-371e1c8c875b
# ╠═1f0792ad-a02a-4c17-97c5-b6bf843cd158
# ╠═e8bbb880-a3bb-41b8-9c65-6c3111772a20
# ╠═38889942-aa5f-4a3a-8b2e-22de8bdb077e
# ╠═a616f640-a34f-4585-9a39-e15deebd6ace
# ╠═973ebd13-71e5-4f9c-a34c-1a8a6b704abf
# ╠═5e30c00d-714d-499d-94cd-fe6594c0e297
# ╠═ca79452f-62f6-4f98-a6f1-b038bb29678b
# ╠═027e21a4-1447-4248-8747-39ee45a19261
# ╠═ecc8f789-caf2-4d82-a768-09347acbc120
# ╠═3a911179-6784-4353-b9e8-c933d48016c5
# ╠═d14063ea-7049-46d0-a100-6a9db43870cc
# ╠═799ad4f1-9770-47e8-a05a-2d63b939777f
# ╠═03e1b7eb-9aad-4a6f-93d9-01aa3f15fd9c
# ╠═baaa2f37-a120-4cfd-a3e0-98012039b073
# ╠═ad95292b-af20-4661-9f3b-772d00087824
# ╠═3d6d5071-9be7-4b00-83df-66af58a572fe
# ╠═d9ec3f56-a83d-4ab3-aafe-50085f0fbb9f
# ╠═376d9664-439a-495a-9c51-a3fffedf632a
# ╠═afacfc10-5be5-40cf-bed6-be74764631f7
# ╠═88cc2521-bdde-4bc5-a5a6-7cdb62aca414
# ╠═ab0b0fd5-a144-45a4-ab1d-7ec9b09a6b5e
# ╠═b918be78-f23c-4d65-8fc1-82b46c4e101b
# ╠═4ee556fb-c27c-4375-9aaa-b71b0257751f
# ╠═a09b03db-dcdb-4c9d-b438-91e1810a6b3a
# ╠═6a58c21f-0980-4ab0-a590-969edf3146d6
# ╠═828b6953-c8a1-4a30-b5a7-a4face5fba60
# ╠═a2fff935-6d20-451b-a448-5519b39890b7
# ╠═4476df2f-b204-4287-82ca-459ff3f3bdba
# ╠═cebf0eb2-e80c-45ca-9515-301924bf1e9b
# ╠═f1a78e4c-e13c-461c-95c8-531b1e48ed36
# ╠═f9d08f76-dd09-41fa-88f6-e70649c71066
# ╠═8a6ad7b4-81e9-4d7e-803e-5b276e96fd51
# ╠═8b3d9a60-5719-4ce6-8e44-20cd2f10c8a4
# ╠═97e4972b-7089-4445-ac39-efa3739eff95
# ╠═31ad5836-a49c-420f-b5e5-cdc1d3b395b0
# ╠═7d6f02eb-128a-4c09-9c3f-6d3f4ada3be7
# ╠═406851aa-791a-4e40-a866-b46301c66041
# ╠═10a1beb0-cbb6-422e-ab0a-b00feb4d7246
# ╠═71206b5d-7ef4-4ad9-8248-f2d3ea66ecc4
# ╠═9a1f4e59-f639-4c28-8ae4-0ba7784976e6
# ╠═6c76fd14-3624-493c-b7bc-92f4d04dd028
# ╠═320fed57-31bf-489c-ad14-6394c0f34786
# ╠═9f916a25-9b49-4900-9998-4ad76d669db2
# ╠═8b987aef-13c2-4b89-9173-c24a97935c64
# ╠═5395a886-96d5-4a99-a942-4fc06463cc59
# ╠═a24ec33f-8224-4152-bd9b-b7d4452d0d18
# ╠═f6272153-00e9-46e6-98b0-957fb5b5900e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

note
	description: "Summary description for {HUFFMAN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class HUFFMAN
create
	make
feature {NONE}
	make(a_string: STRING)
	require
		non_empty_string: a_string.count > 0
	local
		l_queue: HEAP_PRIORITY_QUEUE[HUFFMAN_NODE[CHARACTER]]
		l_counts: HASH_TABLE[INTEGER, CHARACTER]
		l_node: HUFFMAN_NODE[CHARACTER]
		l_left, l_right: HUFFMAN_NODE[CHARACTER]
	do
		create l_queue.make (a_string.count)
		create l_counts.make (10)

		across a_string as  char
		loop
			if not l_counts.has (char.item) then
				l_counts.put (0, char.item)
			end
			l_counts.replace (l_counts.at (char.item) + 1, char.item)
		end

		create leaf_dictionary.make(l_counts.count)

		across l_counts as kv
		loop
			create l_node.leaf_node ((kv.item * 1.0) / a_string.count, kv.key)
			l_queue.put (l_node)
			leaf_dictionary.put (l_node, kv.key)
		end

		from
		until
			l_queue.count <= 1
		loop
			l_left := l_queue.item
			l_queue.remove
			l_right := l_queue.item
			l_queue.remove

			create l_node.inner_node (l_left, l_right)
			l_queue.put (l_node)
		end

		root := l_queue.item
		root.is_zero := false
	end
feature
	root: HUFFMAN_NODE[CHARACTER]
	leaf_dictionary: HASH_TABLE[HUFFMAN_NODE[CHARACTER], CHARACTER]

	encode(a_value: CHARACTER): STRING
	require
		encodable: leaf_dictionary.has (a_value)
	local
		l_node: HUFFMAN_NODE[CHARACTER]
	do
		Result := ""
		if attached  leaf_dictionary.item (a_value) as attached_node then
			l_node := attached_node
			from

			until
				l_node.is_root
			loop
				Result.append_integer (l_node.bit_value)
				if attached l_node.parent as parent then
					l_node := parent
				end
			end

			Result.mirror
		end
	end
end

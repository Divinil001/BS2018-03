class
    BIN_TREE[G->PART_COMPARABLE]

create
    make_tree

feature
    item:G
    left_subtree, right_subtree: detachable BIN_TREE[G]
--    height_tree:INTEGER

feature
    make_tree(new_value:G)
        do
            item:=new_value
        end

	info:G
		do
			Result:=item
		end

	height:INTEGER
		--return the height of binary tree
		local
			lh:INTEGER
			rh:INTEGER
		do
			if left_subtree /= void  then
				if attached left_subtree as ls then
					lh:=ls.height
				end
			end

			if right_subtree /= void then
				if attached right_subtree as rs then
					rh:=rs.height
				end
			end

			Result:= 1 + lh.max(rh)
		end


		left
			--print left subtree
			do

				if left_subtree /= void then
					if attached left_subtree as ls then
						ls.left
					end
				end

				if attached left_subtree as ls then
					print(ls.item)
					print("  ")
				end

			end

		right
			--print right subtree
			do
				if right_subtree /= void then
					if attached right_subtree as rs then
						rs.right
					end
				end
				if attached right_subtree as rs then
					print(rs.item)
					print("  ")
				end

			end

		add(new_item:G)
			--add element(do not add element if tree has such element)
			require
				check_argument:new_item /= void
			do
				if new_item < item then
					if left_subtree = void then
						add_left(new_item)
					else
						if attached left_subtree as ls then
							ls.add (new_item)
						end
					end
				elseif new_item > item then
					if right_subtree = void then
						add_right(new_item)
					else
						if attached right_subtree as rs then
							rs.add (new_item)
						end
					end
				end
			end

feature{BIN_TREE}
	add_left(x:G)
		require
			left_subtree=void
		do
			create left_subtree.make_tree (x)
		end

	add_right(x:G)
		require
			right_subtree=void
		do
			create right_subtree.make_tree (x)
		end

end

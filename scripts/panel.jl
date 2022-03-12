using Term
import Term: chars
install_term_logger()


pprint(pan) = begin
    print(pan)
    println(pan.measure, "   ", length(chars(pan.segments[1].plain)) )
end

# TODO test panels layout

# ---------------------------------------------------------------------------- #
#                                  no content                                  #
# ---------------------------------------------------------------------------- #
# ---------------------------------- fitted ---------------------------------- #
pprint(
    Panel(;fit=true)
)

# --------------------------------- unfitted --------------------------------- #
pprint(
    Panel()
)

pprint(
    Panel(; width=12, height=4)
)




# ---------------------------------------------------------------------------- #
#                                   text only                                  #
# ---------------------------------------------------------------------------- #
# ---------------------------------- fitted ---------------------------------- #
# pprint(
#     Panel("t"; fit=true)
# )

# pprint(
#     Panel("test"; fit=true)
# )

# pprint(
#     Panel("1234\n123456789012"; fit=true)
# )

# pprint(
#     Panel("나랏말싸미 듕귁에 달아\n1234567890123456789012"; fit=true)
# )

# pprint(
#     Panel("."^500; fit=true)
# )

# --------------------------------- unfitted --------------------------------- #
# pprint(
#     Panel("t")
# )

# pprint(
#     Panel("test")
# )

# pprint(
#     Panel("1234\n123456789012")
# )

# pprint(
#     Panel("나랏말싸미 듕귁에 달아\n1234567890123456789012")
# )

# pprint(
#     Panel("."^500)
# )


# ---------------------------------------------------------------------------- #
#                                 nested panels                                #
# ---------------------------------------------------------------------------- #
# ---------------------------------- fitted ---------------------------------- #
# pprint(
#     Panel(
#         Panel("test"; fit=true);
#     fit=true)
# )


# pprint(
#     Panel(
#         Panel(Panel("."; fit=true); fit=true);
#     fit=true)
# )

# pprint(
#     Panel(
#         Panel("."^500; fit=true); fit=true
#     )
# )

# --------------------------------- unfitted --------------------------------- #
# pprint(
#     Panel(
#         Panel("test");
#     fit=true)
# )


# pprint(
#     Panel(
#         Panel(Panel("."); fit=true);
#     fit=true)
# )

# pprint(
#     Panel(
#         Panel("."^2050); fit=true
#     )
# )

# pprint(
#     Panel(
#         Panel("test");
# )
# )


# pprint(
#     Panel(
#         Panel(Panel("."););
# )
# )

# pprint(
#     Panel(
#         Panel("."^250);
#     )
# )

# pprint(
#     Panel(
#         Panel("t1"),
#         Panel("t2"),
#     )
# )

# pprint(
#     Panel(
#         Panel("test", width=42);  width=30, height=8
#     )
# )


# pprint(
#     Panel(
#         Panel("test", width=42,height=12);  width=30, height=8
#     )
# )


# pprint(
#     Panel(
#         Panel("test", width=42,height=12);  width=30, height=8
#     )
# )

# -------------------------- with other renderables -------------------------- #
# pprint(
#     Panel(
#         RenderableText("x".^5)
#     )
# )


# pprint(
#     Panel(
#         RenderableText("x".^500)
#     )
# )

# pprint(
#     Panel(
#         RenderableText("x".^5); fit=true
#     )
# )


# pprint(
#     Panel(
#         RenderableText("x".^500); fit=false
#     )
# )



# ---------------------------------------------------------------------------- #
#                                    titles                                    #
# ---------------------------------------------------------------------------- #

# pprint(
#     Panel(
#         Panel("[red].[/red]"^50, title="test", subtitle="subtest")
#     )
# )

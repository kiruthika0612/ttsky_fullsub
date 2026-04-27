import cocotb
from cocotb.triggers import Timer

@cocotb.test()
async def test_full_subtractor(dut):
    dut._log.info("Starting Full Subtractor Test")

    for a in range(2):
        for b in range(2):
            for bin_in in range(2):

                # Apply inputs: A=ui_in[0], B=ui_in[1], Bin=ui_in[2]
                dut.ui_in.value = (bin_in << 2) | (b << 1) | a

                await Timer(10, units="ns")

                # Expected outputs
                diff = a ^ b ^ bin_in
                bout = ((~a & b) | (~a & bin_in) | (b & bin_in)) & 1

                # Read DUT outputs
                dut_diff = (dut.uo_out.value.integer >> 0) & 1
                dut_bout = (dut.uo_out.value.integer >> 1) & 1

                dut._log.info(
                    f"A={a}, B={b}, Bin={bin_in} => Diff={dut_diff}, Bout={dut_bout}"
                )

                assert dut_diff == diff, \
                    f"Mismatch in Diff for A={a}, B={b}, Bin={bin_in}"

                assert dut_bout == bout, \
                    f"Mismatch in Bout for A={a}, B={b}, Bin={bin_in}"

    dut._log.info("Full Subtractor Test Passed!")
